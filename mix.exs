defmodule Membrane.Caps.Audio.MPEG.Mixfile do
  use Mix.Project

  def project do
    [
      app: :membrane_caps_audio_mpeg,
      version: "0.0.1",
      elixir: "~> 1.6",
      description: "Membrane Multimedia Framework (mpeg audio format definition)",
      maintainers: ["Marcin Lewandowski"],
      licenses: ["MIT"],
      name: "Membrane Caps: Audio.MPEG",
      source_url: "https://github.com/membraneframework/membrane-caps-audio-mpeg",
      preferred_cli_env: [espec: :test],
      deps: deps()
    ]
  end

  defp deps do
    [
      {:espec, "~> 1.4.6", only: :test},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end
end
