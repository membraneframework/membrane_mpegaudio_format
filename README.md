# Membrane Multimedia Framework: MPEG audio format definition

[![CircleCI](https://circleci.com/gh/membraneframework/membrane-caps-audio-mpeg.svg?style=svg)](https://circleci.com/gh/membraneframework/membrane-caps-audio-mpeg)

This package provides MPEG audio format definition (so-called caps) for the
[Membrane Multimedia Framework](https://membraneframework.org).

## Installation

Unless you're developing an Membrane Element it's unlikely that you need to
use this package directly in your app, as normally it is going to be fetched as
a dependency of any element that operates on MPEG audio.

However, if you are developing an Element or need to add it due to any other
reason, just add the following line to your `deps` in the `mix.exs` and run
`mix deps.get`.

```elixir
{:membrane_mpegaudio_format, "~> 0.3"}
```

## Copyright and License

Copyright 2018, [Software Mansion](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane)

[![Software Mansion](https://logo.swmansion.com/logo?color=white&variant=desktop&width=200&tag=membrane-github)](https://swmansion.com/?utm_source=git&utm_medium=readme&utm_campaign=membrane)

Licensed under the [Apache License, Version 2.0](LICENSE)
