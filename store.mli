type value
val int_value : int -> value
val float_value : float -> value
val bool_value : bool -> value
val value_as_int : value -> int
val value_as_float : value -> float
val value_as_bool : value -> bool

type t
val set : string -> value -> t -> unit
val get : string -> t -> value
