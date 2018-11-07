defmodule Membrane.Caps.Audio.MPEG.Mixfile do
  use Mix.Project

  @version "0.1.1"
  @github_url "https://github.com/membraneframework/membrane-caps-audio-mpeg"

  def project do
    [
      app: :membrane_caps_audio_mpeg,
      version: @version,
      elixir: "~> 1.7",
      description: "Membrane Multimedia Framework (mpeg audio format definition)",
      package: package(),
      name: "Membrane Caps: Audio.MPEG",
      source_url: @github_url,
      docs: docs(),
      deps: deps()
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}"
    ]
  end

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => @github_url,
        "Membrane Framework Homepage" => "https://membraneframework.org"
      }
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
