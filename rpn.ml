(* open Base *)
open Stdio
(* open Str *)

let stack = Stack.create ()

let rec compute input = 
	match input with
	| [] -> 
		if Stack.length stack == 1 then
			printf "%f\n" (Stack.pop stack)
		else
			printf "error\n"
	| hd :: tl -> 
		begin
		match hd with
		| "+" -> 
			let op2 = Stack.pop stack in
			let op1 = Stack.pop stack in
			Stack.push (op1 +. op2) stack;
		| "-" -> 
			let op2 = Stack.pop stack in
			let op1 = Stack.pop stack in
			Stack.push (op1 -. op2) stack;
		| "*" -> 
			let op2 = Stack.pop stack in
			let op1 = Stack.pop stack in
			Stack.push (op1 *. op2) stack;
		| "/" -> 
			let op2 = Stack.pop stack in
			let op1 = Stack.pop stack in
			Stack.push (op1 /. op2) stack;
		| "^" -> 
			let op2 = Stack.pop stack in
			let op1 = Stack.pop stack in
			Stack.push (op1 ** op2) stack;
		| token ->
			let fl = Float.of_string token in
			Stack.push fl stack;
		end

		; compute tl

let () = 

	while true do
		try let line = read_line () in
			let strList = Str.split (Str.regexp " ") line in
			compute strList
		with End_of_file
			-> ()
	done;



(*
let rec read_and_accumulate accum =
  let line = In_channel.input_line In_channel.stdin in
  match line with
  | None -> accum
  | Some x -> read_and_accumulate (accum +. Float.of_string x)

let () =
  printf "Total: %F\n" (read_and_accumulate 0.)

  *)