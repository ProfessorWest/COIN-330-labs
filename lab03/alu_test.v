module alu_test();
  reg [31:0] A, B;
  reg [2:0] op; // opcode
  output [0:0] eq; // equality bit
  output [31:0] out; // output

  /*
  module alu(A, B, op, eq, out);
    input [31:0] A, B;
    input [2:0] op;//opcode
    output [1:0] eq;//equality bit
    output [31:0] out;//output
    */

  alu uut(A, B, op, eq, out);

  initial begin
    //add
    A = 3'b011;
    B = 3'b001;
    op = 3'b001;
    #1 $display("A = %b, B = %b, op = %b, out = %b", A, B, op, out);

    //nand
    A = 3'b011;
    B = 3'b001;
    op = 3'b010;
    #1 $display("A = %b, B = %b, op = %b, out = %b", A, B, op, out);

    //equality 0
    A = 3'b011;
    B = 3'b001;
    op = 3'b011;//eq
    #1 $display("A = %b, B = %b, op = %b, out = %b, eq = %b", A, B, op, out, eq);

    //equality 1
    A = 3'b101;
    B = 3'b101;
    op = 3'b011;//eq
    #1 $display("A = %b, B = %b, op = %b, out = %b, eq = %b", A, B, op, out, eq);
  end


endmodule
