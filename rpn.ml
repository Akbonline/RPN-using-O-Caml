(* open Base *)
open Stdio
(* open Str *)

let calc = calc.create ()

let rec compute input = 
	match input with
	| [] -> 
		if calc.length calc == 1 then
			printf "%f\n" (calc.pop calc)
		else
			printf "error\n"
	| hd :: tl -> 
		begin
		match hd with
		
		| "*" -> 
			let operand2 = calc.pop calc in
			let operand1 = calc.pop calc in
			calc.push (operand1 *. operand2) calc;
		| "/" -> 
			let operand2 = calc.pop calc in
			let operand1 = calc.pop calc in
			calc.push (operand1 /. operand2) calc;
		| "^" -> 
			let operand2 = calc.pop calc in
			let operand1 = calc.pop calc in
			calc.push (operand1 ** operand2) calc;
		| "+" -> 
			let operand2 = calc.pop calc in
			let operand1 = calc.pop calc in
			calc.push (operand1 +. operand2) calc;
		| "-" -> 
			let operand2 = calc.pop calc in
			let operand1 = calc.pop calc in
			calc.push (operand1 -. operand2) calc;
		| target ->
			let fl = Float.of_string target in
			calc.push fl calc;
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
