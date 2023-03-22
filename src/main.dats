#include "share/atspre_staload.hats"
staload UN = "prelude/SATS/unsafe.sats"

val+ test_list = $list (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

// 01: Tail of a List
fun {T: t@ype} last {n: nat} .<n>.
(l: list(T, n)): Option(T) =
  case+ l of
  | $list () => None()
  | $list (x) => Some(x)
  | list_cons (_, xs) => last (xs)

val- Some(9) = last<int> test_list
val- None() = last<int> ($list ())

// 02:  Last Two Elements of a List
fun {T: t@ype} last_two {n: nat} .<n>.
(l: list(T, n)): Option(list (T, 2)) =
  case+ l of
  | $list () => None()
  | $list (x) => None()
  | $list (x, y) => Some($list (x, y))
  | list_cons (_, xs) => last_two (xs)

val- Some($list (8, 9)) = last_two<int> test_list
val- None() = last_two<int> ($list (5))
val- None() = last_two<int> ($list ())

// 03: N'th Element of a List
fun {T: t@ype} at {n: nat} .<n>.
(l: list(T, n), k: int): Option(T) =
  case+ l of
  | $list () => None()
  | list_cons (x, xs) => if k = 0 then Some(x) else at(xs, k - 1)

val- Some(5) = at<int> (test_list, 5)
val- None() = at<int> (test_list, 10)

// 04: Length of a List
fun {T: t@ype} length {n: nat}
(l: list(T, n)): int =
  let
    fun loop {n: nat} .<n>.
    (l: list(T, n), i: int): int =
      case+ l of
      | $list () => i
      | list_cons (x, xs) => loop (xs, i + 1)
  in
    loop (l, 0)
  end

val- 10 = length test_list
val- 3 = length ($list (1, 2, 3))

// 05: Reverse a List
fun {T: t@ype} rev {n: nat}
(l: list(T, n)): list(T, n) =
  let
    fun loop {n: nat}{m: nat} .<n>.
    (l: list(T, n), res: list(T, m)): list(T, n+m) =
    case+ l of
    | $list () => res
    | list_cons(x, xs) => loop (xs, list_cons (x, res))
  in
    loop (l, $list ())
  end

val- $list (9, 8, 7, 6, 5, 4, 3, 2, 1, 0) = rev (test_list)

// 06: Palindrome
fun {T: t@ype} palindrome {n: nat}
(l: list(T, n)): bool =
  l = rev l

val- false = palindrome<int> test_list
val- true = palindrome<int> ($list (1, 2, 3, 2, 1))

// This would require some complicated proofs, because the size changes
(* fun {T: t@ype} flatten {n: nat} *)
(* (l: list(T, n)): list(T, _) = () *)

implement main0 () = ()
  (* let *)
  (*   val+ l0 = test_list *)
  (*   val+ l1 = $list () *)

  (*   val- Some($list (x, y)) = (last_two<int> (l0)) *)
  (* in *)
  (*   println! (last<int> (l0)); *)
  (*   println! (last<int> (l1)); *)
  (*   println! ("Some(", x, ", " , y, ')'); *)
  (*   println! (at<int> (test_list, 5)); *)
  (*   println! (rev<int> test_list); *)
  (* end *)
