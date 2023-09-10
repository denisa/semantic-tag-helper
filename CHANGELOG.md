# changelog

[![Keep a Changelog](https://img.shields.io/badge/Keep%20a%20Changelog-1.0.0-informational)](https://keepachangelog.com/en/1.0.0/)
[![Semantic Versioning](https://img.shields.io/badge/Sematic%20Versioning-2.0.0-informational)](https://semver.org/spec/v2.0.0.html)
![clq validated](https://img.shields.io/badge/clq-validated-success)

Keep the newest entry at top, format date according to ISO 8601: `YYYY-MM-DD`.

Categories, defined in [changemap.json](.github/clq/changemap.json)):

- *major* release trigger:
  - `Changed` for changes in existing functionality.
  - `Removed` for now removed features.
- *minor* release trigger:
  - `Added` for new features.
  - `Deprecated` for soon-to-be removed features.
- *bugfix* release trigger:
  - `Fixed` for any bugfixes.
  - `Security` in case of vulnerabilities.

## [1.0.6] - 2022-09-09

### Fixed

- bump actions/checkout to v4 and use major version

## [1.0.5] - 2022-09-09

### Fixed

- use major version of ncipollo/release-action
- bump actions/checkout to v4
- bump superlinter to v5
- introduce `make superlinter` and `make shellcheck` to run the tools locally
- fix various superlinter error

## [1.0.4] - 2022-05-24

### Fixed

- uses the action.sh during own build
- needs `${{ github.action*path }}` to execute correctly
- introduce super linter, and fixes all violations

## 1.0.3 - 2022-05-15 [YANKED]

### Fixed

- action.yml is not working reference wrong script

## 1.0.2 - 2022-05-15 [YANKED]

### Fixed

- action.yml is not working

## 1.0.1 - 2022-05-15 [YANKED]

### Fixed

- action.yml is not working
- fix formatting

## 1.0.0 - 2022-05-14 [YANKED]

### Added

- test/set tag and derived tags
