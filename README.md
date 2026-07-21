# Cofinite Zeros of High Derivatives

[![Lean verification](https://github.com/erichou1/cofinite-derivative-zeros/actions/workflows/lean.yml/badge.svg)](https://github.com/erichou1/cofinite-derivative-zeros/actions/workflows/lean.yml)

Eric Hou, July 20, 2026.

**[Read the paper](paper.pdf)** · **[Browse the Lean proof](CofiniteDerivatives/Main.lean)** · **[View the axiom audit](Audit.lean)**

This repository contains the paper and complete Lean 4 formalization of the existence of a nonzero transcendental entire function whose sufficiently high derivatives have a zero in every prescribed nonempty open subset of the complex plane. The formalized witness also satisfies the explicit growth bound

```text
‖f z‖ ≤ sqrt(2) * exp(‖z‖^2).
```

The strongest fully expanded public theorem is:

```lean
CofiniteDerivatives.exists_transcendental_entire_with_explicit_derivative_zeros_and_growth
```

It states that there is a function `f : ℂ → ℂ` which is nonzero, analytic on all of `ℂ`, globally complex differentiable, not represented by a complex polynomial, and satisfies both:

```lean
∀ U : Set ℂ, IsOpen U → U.Nonempty →
  ∃ N, ∀ n ≥ N, ∃ z ∈ U, iteratedDeriv n f z = 0
```

and, for every strictly increasing `s : ℕ → ℕ`,

```lean
Dense {z : ℂ | ∃ k, iteratedDeriv (s k) f z = 0}
```

as well as the displayed growth bound. The original theorem name without the growth conclusion remains available as a compatibility wrapper:

```lean
CofiniteDerivatives.exists_transcendental_entire_with_explicit_derivative_zeros
```

## Verification status

- Lean 4.28.0 and Mathlib v4.28.0 are pinned in this repository.
- The complete library builds with `lake build CofiniteDerivatives`.
- `Audit.lean` reports only `propext`, `Classical.choice`, and `Quot.sound`.
- Project-owned Lean sources contain no `sorry`, `admit`, or custom `axiom` declarations.
- [`paper.pdf`](paper.pdf) is the compiled five-page A4 manuscript generated from [`paper.tex`](paper.tex).

## Reproduce the proof

Install [elan](https://github.com/leanprover/elan), then run:

```sh
git clone https://github.com/erichou1/cofinite-derivative-zeros.git
cd cofinite-derivative-zeros
lake update
lake build CofiniteDerivatives
lake env lean Audit.lean
```

The first build downloads the pinned Lean and Mathlib dependencies and may take several minutes. The last command prints the final theorems and their axiom dependencies.

To rebuild the paper, install [Tectonic](https://tectonic-typesetting.github.io/) and run:

```sh
tectonic paper.tex
```

## Repository map

- [`CofiniteDerivatives/Main.lean`](CofiniteDerivatives/Main.lean): final existence theorems and summable hole bound.
- [`CofiniteDerivatives/FockGrowth.lean`](CofiniteDerivatives/FockGrowth.lean): explicit quadratic exponential growth estimate.
- [`CofiniteDerivatives/Derivatives.lean`](CofiniteDerivatives/Derivatives.lean): expanded quantifiers and fixed-disk finiteness consequence.
- [`CofiniteDerivatives/`](CofiniteDerivatives/): analytic, probabilistic, topological, and extraction modules.
- [`Audit.lean`](Audit.lean): printed theorem statements and kernel axiom reports.
- [`paper.pdf`](paper.pdf) and [`paper.tex`](paper.tex): manuscript and source.

## Proof architecture

The formal proof uses an iid bounded-coefficient Fock series

```text
f(z) = sum_k ξ_k z^k / sqrt(k!),
```

where each `ξ_k` is uniformly distributed on the complex unit disk. The development formalizes the exact derivative series, entire convergence and nonpolynomiality, saddle estimates, affine small-ball bounds, Jensen's formula, event-dependent logarithmic concentration, summable hole probabilities, a countable rational disk basis, the first Borel-Cantelli lemma, and deterministic sample extraction.

## Relation to Boas--Reddy

Theorem 1 of R. P. Boas Jr. and A. R. Reddy, *Zeros of successive derivatives of entire functions*, **Bull. Amer. Math. Soc.** 79 (1973), 64--65, DOI [10.1090/S0002-9904-1973-13093-9](https://doi.org/10.1090/S0002-9904-1973-13093-9), states that an entire function of order at most two and finite type has an arbitrarily large single disk on which infinitely many derivatives are zero-free. The following page explicitly says that the disk is fixed for those infinitely many derivatives.

The growth-aware theorem in this repository is incompatible with that printed assertion: its explicit bound places the same witness in the asserted growth class, while its cofinite conclusion says that every fixed nonempty disk is hit by every sufficiently high derivative. Thus the formalized theorem supplies a counterexample to the printed 1973 statement. No quantifier distinction between fixed and moving disks resolves the conflict.

The expanded article is R. P. Boas Jr. and A. R. Reddy, *Zeros of the successive derivatives of entire functions*, **J. Math. Anal. Appl.** 42 (1973), 466--473, DOI [10.1016/0022-247X(73)90153-4](https://doi.org/10.1016/0022-247X(73)90153-4). The proof here is independent and does not use either Boas--Reddy paper.

## Citation

Please use the metadata in [`CITATION.cff`](CITATION.cff). A plain-text citation is:

> Eric Hou, “Cofinite Zeros of High Derivatives,” 2026. Lean 4 formalization and manuscript, https://github.com/erichou1/cofinite-derivative-zeros.

## Feedback

Mathematical corrections, Lean issues, and reproducibility reports are welcome through [GitHub Issues](https://github.com/erichou1/cofinite-derivative-zeros/issues). See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the expected verification details.

Copyright © 2026 Eric Hou. No license has been granted unless stated otherwise.
