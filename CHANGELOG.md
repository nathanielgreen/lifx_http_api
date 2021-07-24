# Changelog

All notable changes to this project will be documented in this file. The
format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

The project does **not yet adhere to** [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
That is aimed for after initial release.

## [Unreleased]

---

## [0.0.4] - 2021-05-29

- Make `Bulb.power` non-final.

## [0.0.3] - 2021-05-28

### Added

- A new REPL CLI at `bin/cli.dart` for using local manual testing/use.

### Changed

- `Client.setState` now required the Bulb `id` instead of `uuid`
- `Client.setState` now returns the LIFX API response.
- Added linting and fixed lots of small lint and type errors.

### Fixed

- Passing any of the optional parameters to `Client.setState` will now actually
  add them to the request body.

---

## [0.0.2] - 2021-05-17

### Fixed

- Export `Bulb` class to be used for typing.

---

## [0.0.1] - Initial Release 2021-05-17

### Added

- `listLights()` Client method
- `setState(uuid)` Client method
- `Bulb` Class
