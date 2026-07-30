import MedicineOutbreakInvestigationFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  OutbreakWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse