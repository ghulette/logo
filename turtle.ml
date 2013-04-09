type t = {
  x : float ref;
  y : float ref;
  angle : float ref;
  store : Store.t
}

let make () = {
  x = ref 0.0; 
  y = ref 0.0; 
  angle = ref 0.0; 
  store = Store.make ()
}

let get_x t = !(t.x)

let get_y t = !(t.y)

let get_angle t = !(t.angle)

let set_x t x = 
  t.x := x

let set_y t y = 
  t.y := y

let set_angle t r = 
  t.angle := r

let forward t = 
  t.x := cos !(t.angle) +. !(t.x);
  t.y := sin !(t.angle) +. !(t.y)
