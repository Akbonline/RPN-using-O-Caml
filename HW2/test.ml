open OUnit

let test_fixture = "RPN" >:::
[
	"compute" >:: ( fun () ->
		assert_equal (1.0+.2.0) (rpn.compute ["1";"2";"+"]);
		assert_equal (1.0-.2.0) (rpn.compute ["1";"2";"-"]);
		assert_equal (1.0*.2.0) (rpn.compute ["1";"2";"*"]);
		assert_equal (1.0/.2.0) (rpn.compute ["1";"2";"/"]);
		assert_equal (1.0**2.0) (rpn.compute ["1";"2";"^"]);
		assert_equal (5.0) (rpn.compute ["15"; "7"; "1"; "1"; "+"; "-"; "/"; "3"; "*"; "2"; "1"; "1"; "+"; "+"; "-"]);
	);
]

(* Test Runner; ~verbose:true gives info on succ tests *)
let _ = run_test_tt test_fixture