module alu(A, B, op, eq, out);
  input [31:0] A, B;
  input [2:0] op; // opcode
  output [0:0] eq; // equality bit
  output [31:0] out; // output

  //assign out = A + B;
  //nand(out, A, B);
  //xnor(eq, A, B);

  assign out = (op==1)?(A + B): // add
               (op==2)?(A ~& B):1'bx; // nand
  assign eq  = (op==3)?(A == B):1'bx; // eq
endmodule
