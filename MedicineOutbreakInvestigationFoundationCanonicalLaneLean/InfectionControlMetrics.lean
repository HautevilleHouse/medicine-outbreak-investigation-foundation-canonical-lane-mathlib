import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundation

structure InfectionControlMetricsPackage where
  basicReproductionNumber : Type u
  effectiveReproductionNumber : Type v
  herdImmunityThreshold : Prop
  incidenceRate : Prop
  prevalenceRate : Prop
  caseFatalityRate : Prop

structure InfectionControlMetricsEvidence (I : InfectionControlMetricsPackage) where
  herdImmunityThresholdClosed : I.herdImmunityThreshold
  incidenceRateClosed : I.incidenceRate
  prevalenceRateClosed : I.prevalenceRate
  caseFatalityRateClosed : I.caseFatalityRate

def InfectionControlMetricsClosed (I : InfectionControlMetricsPackage) : Prop :=
  I.herdImmunityThreshold ∧ I.incidenceRate ∧ I.prevalenceRate ∧ I.caseFatalityRate

theorem infection_control_metrics_closed_from_evidence (I : InfectionControlMetricsPackage)
    (E : InfectionControlMetricsEvidence I) : InfectionControlMetricsClosed I := by
  exact And.intro E.herdImmunityThresholdClosed
    (And.intro E.incidenceRateClosed
      (And.intro E.prevalenceRateClosed E.caseFatalityRateClosed))

end MedicineOutbreakInvestigationFoundation
end HautevilleHouse