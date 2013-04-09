type t
type color = int

external init : int -> int -> int -> t = "caml_init"
external cleanup : t -> unit = "caml_cleanup"
external begin_draw : t -> unit = "caml_begin_draw"
external end_draw : string -> t -> unit = "caml_end_draw"
external draw_patch : int -> int -> color -> t -> unit = "caml_draw_patch"
external draw_turtle : float -> float -> float -> color -> t -> unit = "caml_draw_turtle"
