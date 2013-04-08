type 'a t = 'a array array

let init width height f = 
  Array.init width (fun x -> Array.init height (fun y -> f x y))

let get a x y = a.(x).(y)

let iter f a = Array.iter (Array.iter f) a
