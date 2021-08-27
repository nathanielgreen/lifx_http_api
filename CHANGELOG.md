# Changelog

All notable changes to this project will be documented in this file. The
format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

The project does **not yet adhere to** [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
That is aimed for after initial release.

## [Unreleased]



---

## [0.0.11+1] - 2021-08-27

### Added 

- Added `copyWith` method to `Bulb` class.

## [0.0.11] - 2021-08-25

### Changed

- Change `Bulb.color` to `final` for use with
  [Equatable](https://github.com/felangel/equatable/)
- Change `Bulb.brightness` to `final` for use with
  [Equatable](https://github.com/felangel/equatable/)


## [0.0.10] - 2021-08-25

### Fixed

- Expose `LifxPower` enum to library.

## [0.0.9] - 2021-08-25

### Added

- Added `LifxPower` enum.
- Added `LifxUnauthorizedError` and throw it on any unauthorized HTTP errors.
- Added `LifxHttpException` and throw it on any unhandled HTTP responses or
  errors.

### Changed

- Changed `Group` to be `LifxGroup`.
- `Client.listLights` now accepts a selector, with the default set to `all`.
- Refactored `Client.listLights` and `Client.setState` to better handle errors
  and provide http responses on exception. 

## [0.0.8] - 2021-07-25

### Fixed

- Fixed `Bulb.group` to be of type `Group` and not `String`

## [0.0.7] - 2021-07-25

### Added

- Added new `Group` type 
- Added `Group` to `Bulb.group`


## [0.0.6] - 2021-07-24

### Changed

- Change `Bulb.color` to non-final.
- Change `Bulb.brightness` to non-final.

## [0.0.5] - 2021-07-24

### Added

- Expose `LifxColor` to be used in library.

### Changed

- Change `Color` to `LifxColor` for clarity and to avoid naming collisions.

## [0.0.4] - 2021-07-24

### Changed

- Change `Bulb.power` to non-final.

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
