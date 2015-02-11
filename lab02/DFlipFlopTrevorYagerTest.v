`timescale 100ns/100ps
module DFlipFlopTrevorYagerTest();

wire Q, QNOT;
reg CLKREG = 0, DREG;

always #1 CLKREG = !CLKREG;

DFlipFlopTrevorYager Lab2FlipFlop(CLKREG, DREG, Q, QNOT);

initial begin
  DREG = 1'b0;
  $monitor("CLKREG = %b, DREG = %b, Q = %b, QNOT = %b", CLKREG, DREG, Q, QNOT);
  $dumpfile("DFlipFlopTrevorYagerDmpFile.vcd");
  $dumpvars(0, DFlipFlopTrevorYagerTest);

end

endmodule
