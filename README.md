# Cofinite Zeros of High Derivatives

Eric Hou, 2026.

This repository distributes the current manuscript **Cofinite Zeros of High Derivatives**. It gives a proposed construction of a transcendental entire function whose sufficiently high derivatives have a zero in every nonempty open subset of the complex plane.

## Manuscript files

- [`paper.tex`](paper.tex): Bulletin of the Australian Mathematical Society submission source.
- [`paper.pdf`](paper.pdf): PDF compiled from the committed source.
- [`baustms.cls`](baustms.cls): the Bulletin class file used by the manuscript.

The manuscript states the construction, its growth bound, the probabilistic estimates, and every proof used for the claimed cofinite zero-hitting property. It does not rely on this repository as part of its proof.

## Build the paper

Install [Tectonic](https://tectonic-typesetting.github.io/) and run:

```sh
tectonic -X compile paper.tex
```

The committed PDF was built with Tectonic. A clean build should produce a 12-page PDF.

## Repository contents

- [`paper.tex`](paper.tex), [`paper.pdf`](paper.pdf), and [`baustms.cls`](baustms.cls): manuscript materials.
- [`CofiniteDerivatives/`](CofiniteDerivatives/): separate Lean development files retained in the repository.
- [`Audit.lean`](Audit.lean): Lean-development audit helper.
- [`CONTRIBUTING.md`](CONTRIBUTING.md): issue and contribution guidance.

The manuscript neither cites nor depends on the Lean development. Any mathematical claim should be assessed from the manuscript and independent review.

## Citation

Use [`CITATION.cff`](CITATION.cff) for the current citation metadata.

## Feedback

Please report reproducible build problems, typographical errors, or mathematical objections through [GitHub Issues](https://github.com/erichou1/cofinite-derivative-zeros/issues). Include a precise location and supporting argument for mathematical reports.

Copyright © 2026 Eric Hou. No license has been granted unless stated otherwise.
