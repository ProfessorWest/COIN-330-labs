module alu(A, B, op, eq, out);
  input [31:0] A, B;
  input op; //opcode
  output [31:0] out; // output
  output eq; // equality bit

  //assign out = A + B;
  //nand(out, A, B);
  //xnor(eq, A, B);

  assign out = (op==0)?(A + B): // add
               (op==1)?(A ~& B):1'bx; // nand
  assign eq  = (A == B); // eq
endmodule
