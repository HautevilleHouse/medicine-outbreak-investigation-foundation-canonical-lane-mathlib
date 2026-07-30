import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundation

structure PharmacokineticPackage where
  absorptionRate : Type u
  distributionVolume : Type v
  eliminationRate : Type w
  concentrationCurve : Prop
  doseResponse : Prop
  therapeuticWindow : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  concentrationCurveClosed : P.concentrationCurve
  doseResponseClosed : P.doseResponse
  therapeuticWindowClosed : P.therapeuticWindow

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.concentrationCurve ∧ P.doseResponse ∧ P.therapeuticWindow

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.concentrationCurveClosed
    (And.intro E.doseResponseClosed E.therapeuticWindowClosed)

end MedicineOutbreakInvestigationFoundation
end HautevilleHouse