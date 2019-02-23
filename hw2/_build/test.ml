open OUnit

let test_fixture = "RPN" >:::
[
	"procRPN" >:: ( fun () ->
		assert_equal (3.0 *. 3.0) (rpn.procRPN ["3";"3";"*"]);
		assert_equal (2.0 -. 5.0) (rpn.procRPN ["2";"5";"-"]);
		assert_equal (3.0 +. 6.0) (rpn.procRPN ["3";"6";"+"]);
		assert_equal (18.0 /. 2.0) (rpn.procRPN ["18";"2";"/"]);
		assert_equal ("Unknown token aasdsf") (rpn.procRPN ["aasdsf"]);
		assert_equal ("Not enough arguments for *") (rpn.procRPN ["23";"*"]);
		assert_equal (5.000000) (rpn.procRPN ["15"; "7"; "1"; "1"; "+"; "-"; "/"; "3"; "*"; "2"; "1"; "1"; "+"; "+"; "-"]);
		assert_equal (3.0 **.2.0) (rpn.procRPN ["3";"2";"^"]);
	);
]

(* Test Runner; ~verbose:true gives info on succ tests *)
let _ = run_test_tt test_fixture
