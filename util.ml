let rec repeat f = 
  function
  | 0 -> ()
  | n -> f (); repeat f (n - 1)

