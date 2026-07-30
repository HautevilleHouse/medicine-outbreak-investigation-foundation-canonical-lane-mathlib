import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure PharmacokineticPackage where
  drugConcentration : Type u
  timeCourse : Type v
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  compartmentTransfer : Prop
  drugDosingRegimen : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  compartmentTransferClosed : P.compartmentTransfer
  drugDosingRegimenClosed : P.drugDosingRegimen

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧
  P.compartmentTransfer ∧ P.drugDosingRegimen

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.compartmentTransferClosed E.drugDosingRegimenClosed)))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse