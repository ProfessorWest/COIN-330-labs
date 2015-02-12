`timescale 10ns/1ps
module DFlipFlopTrevorYagerTest();

wire OUTPUTQ, OUTPUTQNOT;
reg CLKREG = 0, DREG;

always #1 CLKREG = !CLKREG;

DFlipFlopTrevorYager Lab2FlipFlop(CLKREG, DREG, OUTPUTQ, OUTPUTQNOT);

initial begin
  #1 DREG = 1'b1;
  $monitor("CLKREG = %b, DREG = %b, OUTPUTQ = %b, OUTPUTQNOT = %b", CLKREG, DREG, OUTPUTQ, OUTPUTQNOT);
  $dumpfile("DFlipFlopTrevorYagerDmpFile.vcd");
  $dumpvars(0, DFlipFlopTrevorYagerTest);
  #2 DREG = 1'b0;
  #2 DREG = 1'b1;
  #4 $finish();	

end

endmodule
