# Cofinite Zeros of High Derivatives

This repository contains a Lean 4 formalization of the existence of a nonzero transcendental entire function whose sufficiently high derivatives have a zero in every prescribed nonempty open subset of the complex plane.

The fully expanded public theorem is:

```lean
CofiniteDerivatives.exists_transcendental_entire_with_explicit_derivative_zeros
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

The accompanying manuscript is in [`paper.tex`](paper.tex).
