# Cofinite Zeros of High Derivatives

This repository contains a Lean 4 formalization of the existence of a nonzero transcendental entire function whose sufficiently high derivatives have a zero in every prescribed nonempty open subset of the complex plane. The formalized witness also satisfies the explicit growth bound

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

## Build

The project is pinned to Lean 4.28.0 and Mathlib v4.28.0.

```sh
lake update
lake build CofiniteDerivatives
lake env lean Audit.lean
```

The last command prints the final theorem and its axiom dependencies. The expected dependencies are only Lean's standard foundations:

```text
[propext, Classical.choice, Quot.sound]
```

The project-owned Lean sources contain no `sorry`, `admit`, or custom `axiom` declarations.

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

The accompanying manuscript is in [`paper.tex`](paper.tex). It can be compiled with:

```sh
tectonic paper.tex
```
