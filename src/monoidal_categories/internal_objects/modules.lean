-- Copyright (c) 2017 Scott Morrison. All rights reserved.
-- Released under Apache 2.0 license as described in the file LICENSE.
-- Authors: Stephen Morgan, Scott Morrison
import .semigroup_modules
import .monoids

open categories
open categories.monoidal_category

namespace categories.internal_objects

structure ModuleObject { C : Category } { m : MonoidalStructure C } ( A : MonoidObject m ) extends SemigroupModuleObject A.to_SemigroupObject :=
  ( identity  : C.compose (m.inverse_left_unitor module)  (C.compose (m.tensorMorphisms A.unit (C.identity module)) action) = C.identity module )

attribute [simp,ematch] ModuleObject.identity

structure ModuleMorphism { C : Category } { m : MonoidalStructure C } { A : MonoidObject m } ( X Y : ModuleObject A )
  extends SemigroupModuleMorphism X.to_SemigroupModuleObject Y.to_SemigroupModuleObject

@[applicable] lemma ModuleMorphism_pointwise_equal
  { C : Category }
  { m : MonoidalStructure C }
  { A : MonoidObject m }
  { X Y : ModuleObject A }
  ( f g : ModuleMorphism X Y )
  ( w : f.map = g.map ) : f = g :=
  begin
    induction f with f_underlying,
    induction g with g_underlying,
    tidy,
  end

definition CategoryOfModules { C : Category } { m : MonoidalStructure C } ( A : MonoidObject m ) : Category :=
{
  Obj := ModuleObject A,
  Hom := λ X Y, ModuleMorphism X Y,
  identity := λ X, ⟨ ⟨ C.identity X.module, ♯ ⟩ ⟩, -- we need double ⟨ ⟨ ... ⟩ ⟩ because we're using structure extension
  compose  := λ _ _ _ f g, ⟨ ⟨ C.compose f.map g.map, begin
                                                     tidy,
                                                     rewrite ← C.associativity,
                                                     rewrite ← f.compatibility,
                                                     rewrite C.associativity,
                                                     rewrite ← g.compatibility,
                                                     tidy,
                                                    end ⟩ ⟩
}

end categories.internal_objects