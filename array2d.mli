type 'a t
val init : int -> int -> (int -> int -> 'a) -> 'a t
val get : 'a t -> int -> int -> 'a
val iter : ('a -> unit) -> 'a t -> unit
