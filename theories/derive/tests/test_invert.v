From elpi Require Import derive.invert.


Inductive test A : bool -> Type :=
  K1 : test A true
| K2 : forall x, A -> test A (negb x) -> test A (negb (negb x)).

Elpi derive.invert test.

Check test_inv : Type -> bool -> Type.
Check K1_inv : forall A b, b = true -> test_inv A b.
Check K2_inv : forall A b, forall x, A -> test_inv A (negb x) -> b = negb (negb x) -> test_inv A b.

Inductive listR A PA : list A -> Type :=
  | nilR : listR A PA (@nil A)
  | consR : forall a : A, PA a -> forall xs : list A, listR A PA xs -> listR A PA (cons a xs).

Elpi derive.invert listR.