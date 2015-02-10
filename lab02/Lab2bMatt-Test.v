`timescale 100ns / 100ps
module lab2bTest();

reg clk = 0;
always #1 clk = !clk;
reg [0:0] D;
wire Q;
wire QNot;

lab2b uut (D,clk,Q,QNot);

initial begin
	D = 1'b1;
	$monitor("At time %t, D = %b, Q = %b, QNot = %b", $time, D, Q, QNot);
	$dumpfile ("test.vcd");
	$dumpvars(0,lab2bTest);
	end
endmodule
