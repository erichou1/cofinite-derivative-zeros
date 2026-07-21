# Contributing

Corrections and reproducibility reports are welcome. Please open a GitHub issue before preparing a substantial change so the mathematical and formal scope can be agreed first.

## Mathematical corrections

State the affected theorem or equation precisely, give a minimal counterexample or corrected argument, and indicate whether the issue affects the manuscript, Lean development, or both.

## Lean changes

Use the pinned Lean and Mathlib versions and run:

```sh
lake build CofiniteDerivatives
lake env lean Audit.lean
```

New project-owned code must not introduce `sorry`, `admit`, or custom axioms. Keep changes focused and include a theorem-level regression check when correcting behavior.

## Manuscript changes

Build the paper with:

```sh
tectonic paper.tex
```

Check the resulting PDF for undefined references, warnings, overfull boxes, and unintended layout changes.

## Pull requests

Summarize the mathematical effect, list the commands run, and identify any changed public theorem statements or assumptions. Do not include generated Lean build artifacts.