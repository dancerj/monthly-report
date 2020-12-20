(* fibonacci with simple recursion algorithm.
Copyright 2009 Junichi Uekawa
 *)

let rec fibonacci = function
    0 -> 0
  | 1 -> 1
  | v -> fibonacci (v - 1) + fibonacci (v - 2)

let () = print_int (fibonacci 40); print_newline ()

