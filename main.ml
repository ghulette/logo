open Util

let main = 
  let w = World.make 25 25 in
  repeat 100 (fun () -> World.create_turtle w);
  World.ask_turtles w Turtle.forward
