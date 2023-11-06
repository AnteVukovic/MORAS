Set Implicit Arguments.
Require Import List.
Import ListNotations.
Require Import Lia.

(* Bit *)

Inductive B : Type :=
  | O : B
  | I : B.

Definition And (x y : B) : B :=
match x with
  | O => O
  | I => y
end.

Definition Or (x y : B) : B :=
match x with
  | O => y
  | I => I
end.

Definition Not (x : B) : B :=
match x with
  | O => I
  | I => O
end.

Definition Add (x y c : B) : B :=
match x, y with
  | O, O => c
  | I, I => c
  | _, _ => Not c
end.

Definition Rem (x y c : B) : B :=
match x, y with
  | O, O => O
  | I, I => I
  | _, _ => c
end.

(* List *)

Fixpoint AndL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => And x y :: AndL xs ys
end.

Fixpoint OrL (x y : list B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Or x y :: OrL xs ys
end.

Fixpoint NotL (x : list B) : list B :=
match x with
  | [] => []
  | x :: xs => Not x :: NotL xs
end.

Fixpoint AddLr (x y : list B) (c : B) : list B :=
match x, y with
| [], _ => []
| _, [] => []
| x :: xs, y :: ys => Add x y c :: AddLr xs ys (Rem x y c)
end.

Definition AddL (x y : list B) : list B := rev (AddLr (rev x) (rev y) O).

Fixpoint IncLr (x : list B) (c : B) : list B :=
match x with
| [] => []
| x :: xs => Add x I c :: IncLr xs (Rem x I c)
end.

Definition IncL (x : list B) : list B := rev (IncLr (rev x) O).

(* ALU *)

Definition flag_zx (f : B) (x : list B) : list B :=
match f with
| I => repeat O (length x)
| O => x
end.

Definition flag_nx (f : B) (x : list B) : list B :=
match f with
| I => NotL x
| O => x
end.

Definition flag_f (f : B) (x y : list B) : list B :=
match f with
| I => AddL x y
| O => AndL x y
end.

Definition ALU (x y : list B) (zx nx zy ny f no : B) : list B := 
  flag_nx no (flag_f f (flag_nx nx (flag_zx zx x)) (flag_nx ny (flag_zx zy y))).

(* Teoremi *)

Lemma ALU_zero (x y : list B) :
  length x = length y -> ALU x y I O I O I O = repeat O (length x).
Proof. Abort.

Lemma ALU_minus_one (x y : list B) : 
  length x = length y -> ALU x y I I I O I O = repeat I (length x).
Proof. Abort.

Lemma ALU_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O O = x.
Proof. Abort.

Lemma ALU_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O O = y.
Proof. Abort.

Lemma ALU_Not_x (x y : list B) : 
  length x = length y -> ALU x y O O I I O I = NotL x.
Proof. Abort.

Lemma ALU_Not_y (x y : list B) : 
  length x = length y -> ALU x y I I O O O I = NotL y.
Proof. Abort.

Lemma ALU_Add (x y : list B) : 
  length x = length y -> ALU x y O O O O I O = AddL x y.
Proof. Abort.

(* DZ *)

Lemma ALU_And (x y : list B) : 
  length x = length y -> ALU x y O O O O O O = AndL x y.
Proof.
  intros. simpl. trivial.
Qed.

Lemma ALU_Or (x y : list B) : 
  length x = length y -> ALU x y O I O I O I = OrL x y.
Proof.
  revert x y. simpl. induction x.
  - simpl. split.
  - intros. destruct y.
    + simpl. reflexivity.
    + simpl. simpl in H. apply eq_add_S in H.  rewrite IHx.
      * f_equal. destruct a. destruct b.
        ** simpl. reflexivity.
        ** simpl. reflexivity.
        ** simpl. reflexivity.
      * exact H.
Qed.

Lemma ALU_One (n : nat) (x y : list B) :
  length x = n /\ length y = n /\ n <> 0 -> ALU x y I I I I I I = repeat O (pred n) ++ [I].
Proof.
  intros []. destruct H0. simpl. rewrite H, H0.
  assert (H_NotL : forall (n : nat), NotL (repeat O n) = repeat I n).
  {
    induction n0.
    - simpl. reflexivity.
    - simpl. rewrite IHn0. reflexivity.
  }
  rewrite H_NotL. unfold AddL.
  assert (H_RevL_1 : forall (b : B) (n : nat), repeat b n ++ [b] = b :: repeat b n).
  {
    intros. induction n0.
    - simpl. reflexivity.
    - simpl. rewrite IHn0. reflexivity.
  }
  assert (H_RevL_2 : forall (b : B) (n : nat), rev (repeat b n) = repeat b n).
  {
    intros. induction n0.
    - simpl. reflexivity.
    - simpl. rewrite IHn0. rewrite H_RevL_1. reflexivity.
  }
  rewrite H_RevL_2. induction n;simpl. contradiction.
  assert (H_AddLr : forall (n : nat), AddLr (repeat I n) (repeat I n) I = repeat I n).
  {
    induction n0.
    - simpl. reflexivity.
    - simpl. rewrite IHn0. reflexivity.
  }
  rewrite H_AddLr. rewrite H_RevL_2.
  assert (H_NotL2 : forall (n : nat), NotL (repeat I n ++ [O]) = repeat O n ++ [I]).
  {
    induction n0.
    - simpl. reflexivity.
    - simpl. rewrite IHn0. reflexivity.
  }
  apply H_NotL2.
Qed.







