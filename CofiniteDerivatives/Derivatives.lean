import CofiniteDerivatives.Topology
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.Complex.Basic

open Set

namespace CofiniteDerivatives

/-- The zero set of the `n`-th complex derivative. -/
def derivativeZeroSet (f : ℂ → ℂ) (n : ℕ) : Set ℂ :=
  {z | iteratedDeriv n f z = 0}

/-- Every nonempty open set contains a zero of every sufficiently high derivative. -/
def DerivativesCofinitelyHit (f : ℂ → ℂ) : Prop :=
  CofinitelyHits (derivativeZeroSet f)

/-- Along every increasing sequence of derivative orders, the union of zero sets is dense. -/
def EveryDerivativeSubsequenceDense (f : ℂ → ℂ) : Prop :=
  EverySubsequenceDense (derivativeZeroSet f)

/-- Exact quantifier equivalence for zeros of iterated complex derivatives. -/
theorem derivativesCofinitelyHit_iff_everyDerivativeSubsequenceDense (f : ℂ → ℂ) :
    DerivativesCofinitelyHit f ↔ EveryDerivativeSubsequenceDense f :=
  cofiniteHits_iff_everySubsequenceDense (derivativeZeroSet f)

/-- The cofinite formulation, expanded into its original quantifier order. -/
theorem derivativesCofinitelyHit_iff (f : ℂ → ℂ) :
    DerivativesCofinitelyHit f ↔
      ∀ U : Set ℂ, IsOpen U → U.Nonempty →
        ∃ N, ∀ n ≥ N, ∃ z ∈ U, iteratedDeriv n f z = 0 := by
  unfold DerivativesCofinitelyHit CofinitelyHits goodOrders derivativeZeroSet
  constructor
  · intro h U hU hUne
    obtain ⟨N, hN⟩ := h U hU hUne
    refine ⟨N, fun n hn ↦ ?_⟩
    rcases hN n hn with ⟨z, hz, hzU⟩
    exact ⟨z, hzU, hz⟩
  · intro h U hU hUne
    obtain ⟨N, hN⟩ := h U hU hUne
    refine ⟨N, fun n hn ↦ ?_⟩
    rcases hN n hn with ⟨z, hzU, hz⟩
    exact ⟨z, hz, hzU⟩

end CofiniteDerivatives
