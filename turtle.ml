type t = {
  id : int;
  x : float;
  y : float;
  angle : float;
  store : Store.t
}

let make id = {
  id = id; 
  x = 0.0; 
  y = 0.0; 
  angle = 0.0; 
  store = Store.make ()
}
