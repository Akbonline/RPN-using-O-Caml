open Printf

type token = 
    | Num of float
    | Op of string
    | TError of string

let toToken (str: string) : token = 
        match str with
        | "+" | "-" | "*" | "/" | "^" -> Op(str)
        | _ -> let f=float_of_string_opt(str) in 
            match f with
                | Some(flt) -> Num(flt)
                | None -> TError(str)

type state =
    | MyStack of float list
    | SError of string 

let evalOp (s: string) (op1: float)  (op2: float) : float =
    match s with    
        | "+" -> op1+.op2
        | "-" -> op1-.op2
        | "/" -> op1/.op2
        | "*" -> op1*.op2
        | "^" -> op1**op2
        | _ -> 0.0

let nextState (st: state) (t: token) : state =
    match st with
    | SError(_str) -> st
    | MyStack(lst) ->
        match t with
        | Num(f) -> MyStack(f :: lst)
        | Op(s) -> (
            match lst with
                | op2::op1::tail -> MyStack( evalOp s op1 op2 :: tail)
                | _ -> SError("Not enough arguments for " ^ s)
            )
        | TError(s) -> SError("Unknown token " ^ s)

let printResult (st: state) =
	match st with
	| SError (str) ->
		printf "%s\n" str
	| MyStack(lst) ->
		match lst with
			| [result] -> printf "%f\n" result
			| _ -> printf "Too many operands\n"


let procRPN str =
    str |> 
    Str.split (Str.regexp " +") |> 
    List.map toToken |>
    List.fold_left nextState (MyStack []) |>
    printResult

let () = 

	while true do
		try let line = read_line () in
			procRPN line
		with End_of_file
			-> ()
	done;