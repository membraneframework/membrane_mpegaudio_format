defmodule Membrane.MPEGAudio.Test do
  use ExUnit.Case, async: true

  describe "samples_per_frame/2" do
    import Membrane.MPEGAudio, only: [samples_per_frame: 2]

    test "should return 384 for MPEG 1 layer I" do
      assert samples_per_frame(:v1, :layer1) == 384
    end

    test "should return 1152 for MPEG 1 layer II" do
      assert samples_per_frame(:v1, :layer2) == 1152
    end

    test "should return 1152 for MPEG 1 layer III" do
      assert samples_per_frame(:v1, :layer3) == 1152
    end

    test "should return 384 for MPEG 2 layer I" do
      assert samples_per_frame(:v2, :layer1) == 384
    end

    test "should return 1152 for MPEG 2 layer II" do
      assert samples_per_frame(:v2, :layer2) == 1152
    end

    test "should return 576 for MPEG 2 layer III" do
      assert samples_per_frame(:v2, :layer3) == 576
    end

    test "should return 384 for MPEG 2.5 layer I" do
      assert samples_per_frame(:v2_5, :layer1) == 384
    end

    test "should return 1152 for MPEG 2.5 layer II" do
      assert samples_per_frame(:v2_5, :layer2) == 1152
    end

    test "should return 576 for MPEG 2.5 layer III" do
      assert samples_per_frame(:v2_5, :layer3) == 576
    end
  end

  defp calculate_frame_size(version, layer, bitrate, sample_rate, padding) do
    alias Membrane.MPEGAudio

    MPEGAudio.frame_size(%MPEGAudio{
      version: version,
      layer: layer,
      bitrate: bitrate,
      sample_rate: sample_rate,
      padding_enabled: padding
    })
  end

  describe "frame_size/1" do
    # First 2 values from https://www.ietf.org/proceedings/47/slides/avt-finlayson-00mar/sld005.htm
    test "128 kbps MPEG-1 layer 3 @ 44.1kHz" do
      assert calculate_frame_size(:v1, :layer3, 128, 44_100, false) == 417
      assert calculate_frame_size(:v1, :layer3, 128, 44_100, true) == 418
    end

    test "24 kbps MPEG-2 layer 3 @ 16kHz" do
      assert calculate_frame_size(:v2, :layer3, 24, 16_000, false) == 108
    end

    test "320 kbps MPEG-1 layer 3 @ 44.1kHz" do
      assert calculate_frame_size(:v1, :layer3, 320, 44_100, false) == 1044
      assert calculate_frame_size(:v1, :layer3, 320, 44_100, true) == 1045
    end

    test "192 kbps MPEG-1 layer 3 @ 44.1kHz" do
      assert calculate_frame_size(:v1, :layer3, 192, 44_100, false) == 626
      assert calculate_frame_size(:v1, :layer3, 192, 44_100, true) == 627
    end

    test "160 kbps MPEG-1 layer 2 @ 44.1kHz" do
      assert calculate_frame_size(:v1, :layer2, 160, 44_100, false) == 522
      assert calculate_frame_size(:v1, :layer2, 160, 44_100, true) == 523
    end
  end

  describe "sound_of_silence/0" do
    import Membrane.MPEGAudio, only: [sound_of_silence: 0]

    test "should return proper payload" do
      payload =
        <<255, 251, 16, 100, 0, 15, 240, 0, 0, 105, 0, 0, 0, 8, 0, 0, 13, 32, 0, 0, 1, 0, 0, 1,
          164, 0, 0, 0, 32, 0, 0, 52, 128, 0, 0, 4, 76, 65, 77, 69, 51, 46, 49, 48, 48, 85, 85,
          85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
          85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
          85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85>>

      assert {^payload, _} = sound_of_silence()
    end

    test "should return proper caps" do
      caps = %Membrane.MPEGAudio{
        bitrate: 32,
        channel_mode: :joint_stereo,
        channels: 2,
        copyright: false,
        crc_enabled: true,
        emphasis_mode: :none,
        layer: :layer3,
        mode_extension: :mode2,
        original: true,
        padding_enabled: false,
        private: false,
        sample_rate: 44_100,
        version: :v1
      }

      assert {_, ^caps} = sound_of_silence()
    end
  end
end
