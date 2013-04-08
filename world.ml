type t = {
  patches : Patch.t Array2d.t;
  turtles : Turtle.t list
}

let make width height = {
  patches = Array2d.init width height Patch.make;
  turtles = []
}
