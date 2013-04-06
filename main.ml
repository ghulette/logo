open Agent

let agent = make [|Num 5; Num 3; Binop Add; Yield|];;

run agent;
let result = Stack.pop agent.stack in
print_int result;
print_newline ()
