import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  concentrationProfile : Prop
  therapeuticWindow : Prop
  dosageRegimen : Prop
  absorptionRateClosed : absorptionRate
  distributionVolumeClosed : distributionVolume
  eliminationRateClosed : eliminationRate
  concentrationProfileClosed : concentrationProfile
  therapeuticWindowClosed : therapeuticWindow
  dosageRegimenClosed : dosageRegimen

structure PharmacokineticModelEvidence (P : PharmacokineticModel) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  concentrationProfileClosed : P.concentrationProfile
  therapeuticWindowClosed : P.therapeuticWindow
  dosageRegimenClosed : P.dosageRegimen

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧
  P.concentrationProfile ∧ P.therapeuticWindow ∧ P.dosageRegimen

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.concentrationProfileClosed
          (And.intro E.therapeuticWindowClosed E.dosageRegimenClosed))))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse