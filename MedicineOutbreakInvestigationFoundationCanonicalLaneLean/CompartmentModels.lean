import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOutbreakInvestigationFoundation

structure CompartmentModelPackage where
  susceptible : Type u
  exposed : Type v
  infectious : Type w
  recovered : Type x
  transitionRates : Prop
  populationConstraint : Prop
  basicReproductiveNumber : Prop

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  transitionRatesClosed : M.transitionRates
  populationConstraintClosed : M.populationConstraint
  basicReproductiveNumberClosed : M.basicReproductiveNumber

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.transitionRates ∧ M.populationConstraint ∧ M.basicReproductiveNumber

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.transitionRatesClosed
    (And.intro E.populationConstraintClosed E.basicReproductiveNumberClosed)

end MedicineOutbreakInvestigationFoundation
end HautevilleHouse