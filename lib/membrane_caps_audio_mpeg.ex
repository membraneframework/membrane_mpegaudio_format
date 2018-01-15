defmodule Membrane.Caps.Audio.MPEG do
  @moduledoc """
  This module implements struct for caps representing MPEG audio stream.

  See https://www.mp3-tech.org/programmer/frame_header.html
  """

  @compile {:inline, [
    samples_per_frame: 2,
    sound_of_silence: 0,
  ]}

  # MPEG version
  @type version_t :: :v1 | :v2 | :v2_5

  # MPEG layer
  @type layer_t :: :layer1 | :layer2 | :layer3

  # CRC enabled
  @type crc_enabled_t :: boolean

  # Bitrate
  @type bitrate_t :: pos_integer | :free

  # Sample rate of the audio.
  @type sample_rate_t :: pos_integer

  # Padding enabled
  @type padding_enabled_t :: boolean

  # Private bit set?
  @type private_t :: boolean

  # Channel mode
  @type channel_mode_t :: :stereo | :joint_stereo | :dual_channel | :single_channel

  # Mode extension (in Joint Stereo)
  @type mode_extension_t :: :mode0 | :mode1 | :mode2 | :mode3 | nil

  # Copyright bit set?
  @type copyright_t :: boolean

  # Original bit set?
  @type original_t :: boolean

  # Emphasis mode
  @type emphasis_mode_t :: :none | :emphasis_50_15 | :reserved | :ccit_j_17


  @type t :: %Membrane.Caps.Audio.MPEG{
    version: version_t,
    layer: layer_t,
    crc_enabled: crc_enabled_t,
    bitrate: bitrate_t,
    sample_rate: sample_rate_t,
    padding_enabled: padding_enabled_t,
    private: private_t,
    channel_mode: channel_mode_t,
    mode_extension: mode_extension_t,
    copyright: copyright_t,
    original: original_t,
    emphasis_mode: emphasis_mode_t,
  }

  defstruct \
    version: nil,
    layer: nil,
    crc_enabled: nil,
    bitrate: nil,
    channels: nil,
    sample_rate: nil,
    padding_enabled: nil,
    private: nil,
    channel_mode: nil,
    mode_extension: nil,
    copyright: nil,
    original: nil,
    emphasis_mode: nil


  @doc """
  Returns amount of raw audio samples that are in the frame for given
  version/layer combination.

  Inlined by the compiler.
  """
  @spec samples_per_frame(version_t, layer_t) :: pos_integer
  def samples_per_frame(:v1, :layer1), do: 384
  def samples_per_frame(:v1, :layer2), do: 1152
  def samples_per_frame(:v1, :layer3), do: 1152
  def samples_per_frame(:v2, :layer1), do: 384
  def samples_per_frame(:v2, :layer2), do: 1152
  def samples_per_frame(:v2, :layer3), do: 576
  def samples_per_frame(:v2_5, :layer1), do: 384
  def samples_per_frame(:v2_5, :layer2), do: 1152
  def samples_per_frame(:v2_5, :layer3), do: 576


  @doc """
  Returns one 'silent' frame along with its caps.

  Inlined by the compiler.
  """
  @spec sound_of_silence :: {binary, t}
  def sound_of_silence do
    payload =
      <<255, 251, 16, 100, 0, 15, 240, 0, 0, 105, 0, 0, 0, 8, 0, 0, 13, 32, 0,
      0, 1, 0, 0, 1, 164, 0, 0, 0, 32, 0, 0, 52, 128, 0, 0, 4, 76, 65, 77, 69,
      51, 46, 49, 48, 48,
      85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
      85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
      85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85,
      85, 85, 85, 85, 85>>

    caps = %__MODULE__{
        bitrate: 32, channel_mode: :joint_stereo,
        channels: 2, copyright: false, crc_enabled: true, emphasis_mode: :none,
        layer: :layer3, mode_extension: :mode2, original: true,
        padding_enabled: false, private: false, sample_rate: 44100, version: :v1,
      }

    {payload, caps}
  end

end
