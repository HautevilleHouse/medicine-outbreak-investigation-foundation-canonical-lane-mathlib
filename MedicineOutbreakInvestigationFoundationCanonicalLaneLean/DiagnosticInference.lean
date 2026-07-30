import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure DiagnosticInference where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatio : Prop
  prevalence : Prop
  sensitivityClosed : sensitivity
  specificityClosed : specificity
  positivePredictiveValueClosed : positivePredictiveValue
  negativePredictiveValueClosed : negativePredictiveValue
  likelihoodRatioClosed : likelihoodRatio
  prevalenceClosed : prevalence

structure DiagnosticInferenceEvidence (D : DiagnosticInference) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  likelihoodRatioClosed : D.likelihoodRatio
  prevalenceClosed : D.prevalence

def DiagnosticInferenceClosed (D : DiagnosticInference) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧
  D.negativePredictiveValue ∧ D.likelihoodRatio ∧ D.prevalence

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInference) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed
          (And.intro E.likelihoodRatioClosed E.prevalenceClosed))))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse