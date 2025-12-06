# changelog

[![Keep a Changelog](https://img.shields.io/badge/Keep%20a%20Changelog-1.0.0-informational)](https://keepachangelog.com/en/1.0.0/)
[![Semantic Versioning](https://img.shields.io/badge/Semantic%20Versioning-2.0.0-informational)](https://semver.org/spec/v2.0.0.html)
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

## [1.0.16] - 2025-12-06

### Fixed

- `Makefile` reads version of super-linter from `cy.yaml`
- `Makefile` `lint` calls both `cql` and `super-linter`
- Bump `koalaman/shellcheck` from 0.10.0 to 0.11.0
- Disable `biome`, `black` and `ruff`
- Update linting configurations
- Bump `actions/checkout` from 5 to 6

## [1.0.15] - 2025-08-24

### Fixed

- Bump actions/checkout from 4 to 5

## [1.0.14] - 2025-06-28

### Fixed

- Merge `linter.yaml` with `ci.yaml`... remove link in `README.md`

## [1.0.13] - 2025-06-28

### Fixed

- In scripts, rely on GitHub provided environment variables, not on context.
- Skip all ci jobs for draft pull requests, and rely on job dependencies to control this
- Merge `linter.yaml` with `ci.yaml`
- Upgrade from `github/super-linter@v7` to `super-linter/super-linter@v7`

## [1.0.12] - 2025-06-23

### Fixed

- Rely on Rulesets, not branch name, to decide when to validate the changelog.
- Ignore `.idea`
- Skip builds on draft pull request

## [1.0.11] - 2025-05-11

### Fixed

- Let the GITHUB_ACTOR be the Git user.
- Disable `commitlint`.
- Add missing CI badge for main.
- Support workflow verbose mode.
- Bump `shellcheck` to 0.10.0

## [1.0.10] - 2024-11-03

### Fixed

- Fixed typo in badge name.

## [1.0.9] - 2024-09-04

### Fixed

- Bump `super-linter/super-linter` from 6 to 7 (continued)

## [1.0.8] - 2024-08-20

### Fixed

- Bump `super-linter/super-linter` from 6 to 7
- Disable `prettier`, its opinion differs too much

## [1.0.7] - 2024-08-15

### Fixed

- Bumps github/super-linter from 5 to 6

## [1.0.6] - 2022-09-09

### Fixed

- bump actions/checkout to v4 and use major version
- minimize workflows permissions

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
- needs `${{ github.action_path }}` to execute correctly
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
