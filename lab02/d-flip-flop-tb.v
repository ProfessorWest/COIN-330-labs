`timescale 100ns/100ps
module dFlipFlopTb();

wire slaveQ, slaveQ_;
reg In, clk = 0;

//declare clock
dFlipFlop uut(In, clock, slaveQ, slaveQ_);

always #10 clk = !clk; //toggle clock every 10 ticks

initial begin
  In = 1'b1;
  $monitor("At time %b, D = %b, Q = %b, Q' = %b", clk,
   In, slaveQ, slaveQ_);
  $dumpfile("DFlipFlop.vcd");
  $dumpvars(0, dFlipFlopTb);
end

endmodule
