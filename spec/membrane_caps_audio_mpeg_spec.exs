defmodule Membrane.Caps.Audio.MPEGSpec do
  use ESpec, async: true

  describe "samples_per_frame/2" do
    it "should return 384 for MPEG 1 layer I" do
      expect(described_module().samples_per_frame(:v1, :layer1)) |> to(eq 384)
    end

    it "should return 1152 for MPEG 1 layer II" do
      expect(described_module().samples_per_frame(:v1, :layer2)) |> to(eq 1152)
    end

    it "should return 1152 for MPEG 1 layer III" do
      expect(described_module().samples_per_frame(:v1, :layer3)) |> to(eq 1152)
    end

    it "should return 384 for MPEG 2 layer I" do
      expect(described_module().samples_per_frame(:v2, :layer1)) |> to(eq 384)
    end

    it "should return 1152 for MPEG 2 layer II" do
      expect(described_module().samples_per_frame(:v2, :layer2)) |> to(eq 1152)
    end

    it "should return 576 for MPEG 2 layer III" do
      expect(described_module().samples_per_frame(:v2, :layer3)) |> to(eq 576)
    end

    it "should return 384 for MPEG 2.5 layer I" do
      expect(described_module().samples_per_frame(:v2_5, :layer1)) |> to(eq 384)
    end

    it "should return 1152 for MPEG 2.5 layer II" do
      expect(described_module().samples_per_frame(:v2_5, :layer2)) |> to(eq 1152)
    end

    it "should return 576 for MPEG 2.5 layer III" do
      expect(described_module().samples_per_frame(:v2_5, :layer3)) |> to(eq 576)
    end
  end

  describe "sound_of_silence/0" do
    it "should return proper payload and caps" do
      payload =
        <<255, 251, 16, 100, 0, 15, 240, 0, 0, 105, 0, 0, 0, 8, 0, 0, 13, 32, 0, 0, 1, 0, 0, 1,
          164, 0, 0, 0, 32, 0, 0, 52, 128, 0, 0, 4, 76, 65, 77, 69, 51, 46, 49, 48, 48, 85, 85,
          85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
          85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
          85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85>>

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
        sample_rate: 44100,
        version: :v1
      }

      expect(described_module().sound_of_silence()) |> to(eq {payload, caps})
    end
  end
end
