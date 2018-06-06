defmodule Membrane.Caps.Audio.MPEG.Mixfile do
  use Mix.Project

  def project do
    [
      app: :membrane_caps_audio_mpeg,
      version: "0.1.0",
      elixir: "~> 1.6",
      description: "Membrane Multimedia Framework (mpeg audio format definition)",
      package: package(),
      name: "Membrane Caps: Audio.MPEG",
      source_url: link(),
      docs: docs(),
      deps: deps()
    ]
  end

  defp link do
    "https://github.com/membraneframework/membrane-caps-audio-mpeg"
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => link(),
        "Membrane Framework Homepage" => "https://membraneframework.org"
      }
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev, runtime: false}
    ]
  end
end
