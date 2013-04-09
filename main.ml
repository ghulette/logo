open Util

let pi = 4.0 *. atan 1.0

let () = 
  let w = World.make 25 25 in
  repeat (fun () -> World.create_turtle w) 100;
  World.ask_turtles w begin fun t -> 
    Turtle.set_x t 12.0;
    Turtle.set_y t 12.0;
    Turtle.set_angle t (Random.float (2.0 *. pi));
    repeat (fun () -> Turtle.forward t) 10
  end;
  World.render w "image.png"
