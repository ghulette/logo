type t = {
  width : int;
  height : int;
  patches : Patch.t Array2d.t;
  turtles : Turtle.t list ref;
  rinfo : Render.t;
}

let make width height = {
  width = width;
  height = height;
  patches = Array2d.init width height Patch.make;
  turtles = ref [];
  rinfo = Render.init width height 40
}

let create_turtle world = 
  let turtle = Turtle.make () in
  let turtles = turtle :: !(world.turtles) in
  world.turtles := turtles

let ask_turtles world f = 
  List.iter f !(world.turtles)

let ask_patches world f = 
  Array2d.iter f world.patches

let render world filename =
  let info = world.rinfo in
  Render.begin_draw info;
  for y=0 to (world.height - 1) do
    for x=0 to (world.width - 1) do
      Render.draw_patch x y (((x+y) mod 2) + 6) info;
    done;
  done;
  List.iter begin fun t ->
    let x = Turtle.get_x t in
    let y = Turtle.get_y t in
    let r = Turtle.get_angle t in
    let c = 0 in
    Render.draw_turtle x y r c info;
  end !(world.turtles);
  Render.end_draw filename info;
  Render.cleanup info
