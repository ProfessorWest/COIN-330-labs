module bitadder_test();
  reg [31:0] A, B;
  output [31:0] sum; // output

  bitadder uut(A, B, sum);

  initial begin
    // add
    A = 32'b101;
    B = 32'b001;
    #1 $display("A = %b, B = %b, out = %b", A, B, sum);
  end

endmodule
