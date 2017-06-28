-- Copyright (c) 2017 Scott Morrison. All rights reserved.
-- Released under Apache 2.0 license as described in the file LICENSE.
-- Authors: Stephen Morgan, Scott Morrison
import .pentagon_in_terms_of_natural_transformations_definitions

open categories
open categories.functor
open categories.products
open categories.natural_transformation

namespace categories.monoidal_category

universe variables u v

-- lemma pentagon_in_terms_of_natural_transformations
--    { C : Category.{u v} } ( m : MonoidalStructure C ) :
--   pentagon_3step m = pentagon_2step m :=
--   begin 
--     dsimp,
--     -- FIXME this apply takes 15 minutes ???
--     apply NaturalTransformations_componentwise_equal,
--     {
--       tidy,
--       exact m.pentagon _ _ _ _ -- TODO it would be nice if this could be automated...
--     },
-- end

end categories.monoidal_category
