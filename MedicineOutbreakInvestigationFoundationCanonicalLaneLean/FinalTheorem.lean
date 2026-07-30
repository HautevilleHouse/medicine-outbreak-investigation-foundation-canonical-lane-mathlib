import canonicalLaneMathlib.AdmissibleClass
import MedicineOutbreakInvestigationFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundation

def ConstrainedOutbreakClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_outbreak_endgame (A : AdmissibleClass) :
    ConstrainedOutbreakClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineOutbreakInvestigationFoundation
end HautevilleHouse