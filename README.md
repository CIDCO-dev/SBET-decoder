# SBET-decoder

`SBET-decoder` converts binary Smoothed Best Estimated Trajectory (SBET) files
and associated accuracy files into plain-text tables.

The repository provides two command-line tools:
- `sbet-decoder`: decodes SBET trajectory entries.
- `accuracy-decoder`: decodes SBET accuracy entries.

Current project version is stored in `VERSION`.
Versioning rules are documented in `VERSION.md`.

## Requirements

- Linux: `g++`, `make`
- Optional for API docs: `doxygen`
- Windows (native build): Visual Studio C++ Build Tools and `nmake`/`make`

## Build

```bash
make
```

This produces:
- `build/bin/sbet-decoder`
- `build/bin/accuracy-decoder`

## Run

```bash
build/bin/sbet-decoder path/to/file.out > sbet.txt
build/bin/accuracy-decoder path/to/file.out > accuracy.txt
```

If no input file is provided, each binary prints usage information.

## Tests

```bash
make test
```

Test reports are written to:
- `build/test/reports/sbet-test-linux-report.xml`

## Documentation

Generate Doxygen documentation:

```bash
make doc
```

Additional format examples are documented in `doc/README.md`.

## CI

Continuous integration is provided with GitHub Actions in
`.github/workflows/ci.yml`.
It uses GitHub-hosted runners only (no self-hosted runner required).
The workflow validates:
- Linux build and tests
- Windows build and tests
- Doxygen documentation generation
