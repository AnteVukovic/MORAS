Infix "||" := orb.
Infix "&&" := andb.

Goal
  forall x y,
  (x && negb y) ||
  (negb x && negb y) ||
  (negb x && y)
  = negb (x && y)
.
Proof.
  intros. destruct x, y; trivial.
Qed.

Goal
  forall x y z,
  negb (negb x && y && z) &&
  negb (x && y && z) &&
  (x && negb y && z)
  = (x && negb y && z)
.
Proof.
  intros. destruct x, y, z; trivial.
Qed.