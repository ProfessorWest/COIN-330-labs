module signextend_test();
  reg [15:0] in;
  output [31:0] out;

  signextend uut(in, out);

  initial begin
    in = 32'b101;
    #1 $display("in = %b, out = %b", in, out);
  end

endmodule
