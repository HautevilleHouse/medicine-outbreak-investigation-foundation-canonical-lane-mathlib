import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundationCanonicalLaneLean

structure CompartmentModel where
  susceptible : Type u
  exposed : Type v
  infectious : Type w
  recovered : Type x
  susceptibleProp : Prop
  exposedProp : Prop
  infectiousProp : Prop
  recoveredProp : Prop
  transitionRates : Prop
  basicReproductiveNumber : Prop
  susceptiblePropClosed : susceptibleProp
  exposedPropClosed : exposedProp
  infectiousPropClosed : infectiousProp
  recoveredPropClosed : recoveredProp
  transitionRatesClosed : transitionRates
  basicReproductiveNumberClosed : basicReproductiveNumber

structure CompartmentModelEvidence (M : CompartmentModel) where
  susceptiblePropClosed : M.susceptibleProp
  exposedPropClosed : M.exposedProp
  infectiousPropClosed : M.infectiousProp
  recoveredPropClosed : M.recoveredProp
  transitionRatesClosed : M.transitionRates
  basicReproductiveNumberClosed : M.basicReproductiveNumber

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.susceptibleProp ∧ M.exposedProp ∧ M.infectiousProp ∧ M.recoveredProp ∧
  M.transitionRates ∧ M.basicReproductiveNumber

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) :
    CompartmentModelClosed M := by
  exact And.intro E.susceptiblePropClosed
    (And.intro E.exposedPropClosed
      (And.intro E.infectiousPropClosed
        (And.intro E.recoveredPropClosed
          (And.intro E.transitionRatesClosed E.basicReproductiveNumberClosed))))

end MedicineOutbreakInvestigationFoundationCanonicalLaneLean
end HautevilleHouse