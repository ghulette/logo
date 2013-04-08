let rec repeat n f =
  match n with
  | 0 -> ()
  | _ -> f (); repeat (n - 1) f
  
