import MedicineOutbreakInvestigationFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse