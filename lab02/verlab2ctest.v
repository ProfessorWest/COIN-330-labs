//Martin Hutchens
//Lab2 d:
`timescale 10ns/10ps
module verlab2ctest();

reg clk = 0;
always #1 clk = !clk;
wire Q;
wire Qnot;
reg[0:0]D;
verlab2c uut(Q,Qnot,D,clk);

initial begin	
	D=1'b1;
	$monitor("At time %t, D = %b, Q = %b, Qnot = %b",$time,D,Q,Qnot);
	$dumpfile("test.vcd");
	$dumpvars(0,verlab2ctest);
end
endmodule


//iverilog *.v
//vvp a.out
