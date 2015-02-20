module signextend_test();
  reg [15:0] in;
  output [31:0] out;

  signextend uut(in, out);

  initial begin
    in = 16'b001;
    #1 $display("in = %b, out = %b", in, out);
    in = 16'b1000000000000101;
    #1 $display("in = %b, out = %b", in, out);
  end

endmodule
