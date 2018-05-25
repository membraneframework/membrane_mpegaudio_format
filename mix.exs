defmodule Membrane.Caps.Audio.MPEG.Mixfile do
  use Mix.Project

  def project do
    [
      app: :membrane_caps_audio_mpeg,
      version: "0.0.1",
      elixir: "~> 1.6",
      description: "Membrane Multimedia Framework (mpeg audio format definition)",
      package: package(),
      name: "Membrane Caps: Audio.MPEG",
      source_url: "https://github.com/membraneframework/membrane-caps-audio-mpeg",
      deps: deps()
    ]
  end

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache 2.0"]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end
end
