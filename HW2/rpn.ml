open Stdio

let stack = Stack.create ()
exception RPNFail

let rec compute input = 
	match input with
	| [] -> 
		if Stack.length stack == 1 then
			Stack.pop stack
		else
			raise RPNFail
	| hd :: tl -> 
		begin
		try
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
				let fl = Pervasives.float_of_string  token in
				Stack.push fl stack;
		with Stack.Empty 
			-> raise RPNFail
		end

		; compute tl

let () = 

	while true do
		try let line = read_line () in
			let strList = Str.split (Str.regexp " +") line in
			try	
				printf "%f\n" (compute strList)
			with RPNFail
				-> printf "Invalid computation\n"
		with End_of_file
			-> ()
	done;