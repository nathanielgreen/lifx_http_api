# LIFX HTTP API

**NOTE:** This library is currently a WIP and therefore unstable, and should not be used for any production environments.

A dart implementation of the [LIFX HTTP
API](https://api.developer.lifx.com/docs/introduction). This package also
provides classes for LIFX devices and device properties.

A CLI REPL is available at `bin/cli.dart`.

## Usage

You'll need a LIFX Personal Access Token to interact with the LIFX HTTP API. 
You can generate one with your LIFX Cloud account here: https://cloud.lifx.com/settings

See `example/main.dart` on how to pass this token to the dart client.


## LIFX HTTP API Implementation Checklist

- [x] (GET) List Lights
- [x] (PUT) Set State
- [ ] (PUT) Set States
- [ ] (POST) Set Delta
- [ ] (POST) Toggle Power
- [ ] (POST) Breathe Effect
- [ ] (POST) Move Effect
- [ ] (POST) Morph Effect
- [ ] (POST) Flame Effect
- [ ] (POST) Pulse Effect
- [ ] (POST) Effects Off
- [ ] (POST) Cycle
- [ ] (GET) List Scenes
- [ ] (PUT) Activate Scene
- [ ] (GET) Validate Color
- [ ] (POST) Clean

## LIFX Device Support

- [x] Bulb
- [ ] Multizone
- [ ] Tile

## Repl

This library also ships with a command line REPL to use the library. To use it:

- Copy the .env example: `cp .env.example .env`
- Add your LIFX Developer API key to the .env file
- Run `dart run bin/cli.dart`
- Run `help` in the REPL to get a list of available commands.

