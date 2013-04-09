open Util

let main = 
  let w = World.make 25 25 in
  repeat (fun () -> World.create_turtle w) 100;
  World.ask_turtles w Turtle.forward;
  Render.test ()
