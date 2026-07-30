import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure InterventionEffectivenessPackage where
  interventionName : String
  reductionRate : ℝ
  reproductionNumberAfter : ℝ
  preventedInfections : ℕ
  costEffectivenessRatio : ℝ
  effectivenessProven : Prop

structure InterventionEffectivenessEvidence (I : InterventionEffectivenessPackage) where
  reductionRateIn01 : 0 ≤ I.reductionRate ∧ I.reductionRate ≤ 1
  reproductionNumberAfterPositive : I.reproductionNumberAfter > 0
  preventedInfectionsNonnegative : 0 ≤ I.preventedInfections
  costEffectivenessRatioNonnegative : I.costEffectivenessRatio ≥ 0
  effectivenessProvenClosed : I.effectivenessProven

def InterventionEffectivenessClosed (I : InterventionEffectivenessPackage) : Prop :=
  (0 ≤ I.reductionRate ∧ I.reductionRate ≤ 1) ∧
  I.reproductionNumberAfter > 0 ∧
  (0 : ℕ) ≤ I.preventedInfections ∧
  I.costEffectivenessRatio ≥ 0 ∧
  I.effectivenessProven

theorem intervention_effectiveness_closed_from_evidence
    (I : InterventionEffectivenessPackage)
    (E : InterventionEffectivenessEvidence I) : InterventionEffectivenessClosed I := by
  exact And.intro E.reductionRateIn01
    (And.intro E.reproductionNumberAfterPositive
      (And.intro E.preventedInfectionsNonnegative
        (And.intro E.costEffectivenessRatioNonnegative E.effectivenessProvenClosed)))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse
