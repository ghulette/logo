type value = int

type binop =
  | Add
  | Mult

let binop_op op =
  match op with
  | Add -> ( + )
  | Mult -> ( * )

type instr =
  | Yield
  | Binop of binop
  | Num of int

type t = {
  stack : value Stack.t;
  program : instr array;
  ip : int ref
}

let make program = {
  stack = Stack.create ();
  program = program;
  ip = ref 0
}

let curr_instr agent =
  agent.program.(!(agent.ip))

let step s i = 
  match i with
  | Binop op -> 
    let f = binop_op op in
    let y = Stack.pop s in
    let x = Stack.pop s in
    Stack.push (f x y) s
  | Num n -> 
    Stack.push n s
  | _ -> ()

let rec run agent =
  let instr = curr_instr agent in
  match instr with
  | Yield -> ()
  | _ -> 
    step agent.stack instr; 
    incr agent.ip; 
    run agent
