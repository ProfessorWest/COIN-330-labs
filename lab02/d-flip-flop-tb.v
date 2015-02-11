`timescale 10ns/10ps
module dFlipFlopTb();

wire slaveQ, slaveQ_;
reg In, clk = 0;

dFlipFlop uut(In, clk, slaveQ, slaveQ_);

//declare clock
always begin
#1 clk = !clk; //toggle clock every 10 ticks
end

initial begin
  #1 In= 1'b1;
  $monitor("At time %t, clk = %b, D = %b, Q = %b, Q' = %b", $time,
   clk, In, slaveQ, slaveQ_);
  $dumpfile("DFlipFlop.vcd");
  $dumpvars(0, dFlipFlopTb);
  #2 In = 1'b0;
  #2 In = 1'b1;
  #10 $finish();
end

endmodule
