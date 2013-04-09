type t

val make : int -> int -> t
val create_turtle : t -> unit
val ask_turtles : t -> (Turtle.t -> unit) -> unit
val ask_patches : t -> (Patch.t -> unit) -> unit
val render : t -> string -> unit
