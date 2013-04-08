type t = {
  patches : Patch.t Array2d.t;
  turtles : Turtle.t list ref
}

let make width height = {
  patches = Array2d.init width height Patch.make;
  turtles = ref []
}

let create_turtle world = 
  let turtle = Turtle.make () in
  let turtles = turtle :: !(world.turtles) in
  world.turtles := turtles

let ask_turtles world f = 
  List.iter f !(world.turtles)

let ask_patches world f = 
  Array2d.iter f world.patches
