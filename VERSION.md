# Versioning

Current project version: `0.1.0`

The canonical machine-readable version is stored in the root `VERSION` file.
CI and automation scripts must read the version from `VERSION`.

## Push Change Log

Use this file to list the effective changes introduced at each push.

### 2026-02-19 - Version 0.1.0

- Added GitHub Actions CI workflow (`.github/workflows/ci.yml`) for Linux, Windows, and documentation jobs.
- Removed Jenkins pipeline configuration (`Jenkinsfile`).
- Expanded project documentation (`README.md`, `CONTRIBUTING.md`, `doc/README.md`).
- Added version tracking files (`VERSION`, `VERSION.md`) and updated `CHANGELOG.md`.
- Improved test coverage for CLI usage and missing-input behavior.
- Updated build/test flags to keep test compilation compatible with modern Linux environments.

## Update Rule

For every push:
1. Add a new entry in `Push Change Log` with date and version.
2. List the concrete changes included in that push.
3. Keep `VERSION` and the version header in this file aligned when version changes.
