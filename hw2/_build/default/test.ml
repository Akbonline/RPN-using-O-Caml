open OUnit

let test_fixture = "RPN" >:::
[
	"compute" >:: ( fun () ->
		assert_equal (1.0+.2.0) (rpn.compute ["1";"2"]);
	);
]

(* Test Runner; ~verbose:true gives info on succ tests *)
let _ = run_test_tt test_fixture