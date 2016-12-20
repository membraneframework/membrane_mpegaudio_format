defmodule Membrane.Caps.Audio.Mpeg do
  @moduledoc """
  This module implements struct for caps representing a single mpeg-encoded
  audio frame.
  """


  # Amount of channels inside Mpeg frame.
  #
  # Can be 1 or 2.
  @type channels_t :: 1 | 2


  @type t :: %Membrane.Caps.Audio.Mpeg{
    channels: channels_t,
  }

  defstruct \
    channels: nil
end
