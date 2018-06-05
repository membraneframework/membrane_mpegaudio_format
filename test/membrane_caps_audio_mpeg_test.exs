defmodule Membrane.Caps.Audio.MPEGTest do
  use ExUnit.Case, async: true

  describe "samples_per_frame/2" do
    import Membrane.Caps.Audio.MPEG, only: [samples_per_frame: 2]

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

  describe "sound_of_silence/0" do
    import Membrane.Caps.Audio.MPEG, only: [sound_of_silence: 0]

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
      caps = %Membrane.Caps.Audio.MPEG{
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
