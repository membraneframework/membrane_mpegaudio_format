defmodule Membrane.Caps.Audio.MPEG do
  @moduledoc """
  This module implements struct for caps representing MPEG audio stream.

  See https://www.mp3-tech.org/programmer/frame_header.html
  """

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
end
