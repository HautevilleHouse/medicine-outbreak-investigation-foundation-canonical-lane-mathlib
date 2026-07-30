import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure SurvivalAnalysis where
  hazardFunction : Prop
  survivalFunction : Prop
  censoringMechanism : Prop
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop
  hazardFunctionClosed : hazardFunction
  survivalFunctionClosed : survivalFunction
  censoringMechanismClosed : censoringMechanism
  kaplanMeierEstimatorClosed : kaplanMeierEstimator
  coxProportionalHazardsClosed : coxProportionalHazards
  logRankTestClosed : logRankTest

structure SurvivalAnalysisEvidence (S : SurvivalAnalysis) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  censoringMechanismClosed : S.censoringMechanism
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest

def SurvivalAnalysisClosed (S : SurvivalAnalysis) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.censoringMechanism ∧
  S.kaplanMeierEstimator ∧ S.coxProportionalHazards ∧ S.logRankTest

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysis) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.censoringMechanismClosed
        (And.intro E.kaplanMeierEstimatorClosed
          (And.intro E.coxProportionalHazardsClosed E.logRankTestClosed))))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse