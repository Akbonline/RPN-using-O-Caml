I Compiled in a Linux kernal using dune. 
The code is compiled using dune. To install dune, visit https://www.dune-project.org/doc/installation/
To compile the code, use the command:
dune build rpn.exe
To test the code, run the following command:
./_build/default/rpn.exe < test.txt
To change the inputs:
    -> Change the Text Lines in "test.txt" file 
    -> Valid Inputs are Postfix Notations (operand1 operand2 operator)
Note: test.txt and rpn.exe has to be in the same folder. Also, to break the code, Ctrl+c (Keyboard Interruption).

Compililing using Ocaml (Windows):

ocamlc -o rpn.ml rpn
ocaml rpn.ml

Caution:
There are two files with the name: test but they have different extensions. "test.ml" is ounit for unit testing. While test.txt is the input file.