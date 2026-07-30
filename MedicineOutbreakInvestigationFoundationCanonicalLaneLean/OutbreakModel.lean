import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure OutbreakModelPackage where
  basicReproductionNumber : Prop
  effectiveReproductionNumber : Prop
  incubationDistribution : Prop
  infectiousPeriod : Prop
  interventionEffect : Prop
  epidemicCurve : Prop
  herdImmunityThreshold : Prop

structure OutbreakModelEvidence (O : OutbreakModelPackage) where
  basicReproductionNumberClosed : O.basicReproductionNumber
  effectiveReproductionNumberClosed : O.effectiveReproductionNumber
  incubationDistributionClosed : O.incubationDistribution
  infectiousPeriodClosed : O.infectiousPeriod
  interventionEffectClosed : O.interventionEffect
  epidemicCurveClosed : O.epidemicCurve
  herdImmunityThresholdClosed : O.herdImmunityThreshold

def OutbreakModelClosed (O : OutbreakModelPackage) : Prop :=
  O.basicReproductionNumber ∧ O.effectiveReproductionNumber ∧
  O.incubationDistribution ∧ O.infectiousPeriod ∧
  O.interventionEffect ∧ O.epidemicCurve ∧ O.herdImmunityThreshold

theorem outbreak_model_closed_from_evidence (O : OutbreakModelPackage)
    (E : OutbreakModelEvidence O) : OutbreakModelClosed O := by
  exact And.intro E.basicReproductionNumberClosed
    (And.intro E.effectiveReproductionNumberClosed
      (And.intro E.incubationDistributionClosed
        (And.intro E.infectiousPeriodClosed
          (And.intro E.interventionEffectClosed
            (And.intro E.epidemicCurveClosed E.herdImmunityThresholdClosed)))))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse