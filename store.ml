type value = 
  | IntVal of int
  | FloatVal of float
  | BoolVal of bool

let int_value x = IntVal x

let float_value x = FloatVal x

let bool_value x = BoolVal x

let value_as_int v = 
  match v with
  | IntVal x -> x
  | FloatVal x -> int_of_float x
  | BoolVal x -> if x then 1 else 0

let value_as_float v = 
  match v with
  | IntVal x -> float_of_int x
  | FloatVal x -> x
  | BoolVal x -> if x then 1.0 else 0.0

let value_as_bool v = 
  match v with
  | IntVal x -> x > 0
  | FloatVal x -> x > 0.0
  | BoolVal x -> x


type t = (string, value) Hashtbl.t

let set id v s = Hashtbl.replace s id v

let get id s = Hashtbl.find s id
