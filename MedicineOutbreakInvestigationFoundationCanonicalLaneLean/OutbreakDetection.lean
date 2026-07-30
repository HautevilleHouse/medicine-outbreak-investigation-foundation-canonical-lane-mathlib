import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure OutbreakDetectionPackage where
  incidenceRate : Prop
  epidemicThreshold : Prop
  surveillanceSystem : Prop
  earlyWarningSignal : Prop
  clusterDetection : Prop
  outbreakConfirmed : Prop

structure OutbreakDetectionEvidence (O : OutbreakDetectionPackage) where
  incidenceRateClosed : O.incidenceRate
  epidemicThresholdClosed : O.epidemicThreshold
  surveillanceSystemClosed : O.surveillanceSystem
  earlyWarningSignalClosed : O.earlyWarningSignal
  clusterDetectionClosed : O.clusterDetection
  outbreakConfirmedClosed : O.outbreakConfirmed

def OutbreakDetectionClosed (O : OutbreakDetectionPackage) : Prop :=
  O.incidenceRate ∧ O.epidemicThreshold ∧ O.surveillanceSystem ∧
  O.earlyWarningSignal ∧ O.clusterDetection ∧ O.outbreakConfirmed

theorem outbreak_detection_closed_from_evidence (O : OutbreakDetectionPackage)
    (E : OutbreakDetectionEvidence O) : OutbreakDetectionClosed O := by
  exact And.intro E.incidenceRateClosed
    (And.intro E.epidemicThresholdClosed
      (And.intro E.surveillanceSystemClosed
        (And.intro E.earlyWarningSignalClosed
          (And.intro E.clusterDetectionClosed E.outbreakConfirmedClosed))))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse