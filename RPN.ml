open Stdlib
open Stdio
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
        | "*" -> op1*.op2
        | "/" -> op1/.op2
        | "^" -> op1**op2
        | _ -> 0.0
        
let nextState (st: state) (t: token) : state =
    match st with
    | SError(str) -> st
    | MyStack(lst) -> 
        match t with
        | Num(f) -> MyStack(f :: lst)
        | Op(s) -> (
            match lst with
                | op2::op1::tail -> MyStack( evalOp s op1 op2 :: tail)
                | _ -> SError("Not enough arguments for " ^ s)
            )
        | TError(s) -> SError("Unknown token " ^ s)
let display out st t= 
    match st with
    | SError(str) -> fprintf out "%s" (str)
    | MyStack(lst) -> 
        match t with
        | Num(f) -> fprintf out "%f" (f)
        | _ -> ()

let procRPN str =
    str |> 
    String.split_on_char ' ' |> 
    List.map toToken |>
    List.fold_left nextState (MyStack [])
    (* 
      Finish testing for correctness of final state
      Print error from state or final error 
    *)
let line = "1 2 +"
let strlist = Str.split(Str.regexp " +") line
let disp = display stdout 

let () = 
    disp (procRPN strlist)
			
	