type t = {
  x : int;
  y : int;
  store : Store.t
}

let make x y = {x=x; y=y; store = Store.make ()}
