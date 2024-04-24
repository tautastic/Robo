import Game.Metadata

World "Cantor"
Level 1

Title "Absolute fixed point"

Introduction
"
For an endo-function `f : α → α` the proposition `IsFixedPt f x` asserst that `x` is a fixed point
of `f`, that is `f x = x`.
"

open Function Set

Statement : ∀ (x : ℝ), IsFixedPt abs x ↔ 0 ≤ x := by
  intro x
  constructor
  · intro h
    rw [← h]
    Branch
      simp only [abs_nonneg]
    Branch
      positivity
    simp
  · intro h
    unfold IsFixedPt
    Branch
      rw [abs_of_nonneg h]
    simp
    assumption


/---/
DefinitionDoc abs as "|·|"

NewDefinition Function.IsFixedPt abs
-- NewTactic positivity
-- NewTheorem abs_of_nonneg abs_nonneg

TheoremTab "Function"
