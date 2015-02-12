`timescale 10ns / 1ns
module lab2bTest();

reg clk = 0;
always #1 clk = !clk;
wire Q;
wire QNot;
reg [0:0] D;

Lab2b uut(D,clk,Q,QNot);

initial begin
	D = 1'b1;
	$monitor("At time %t, D = %b, Q = %b, QNot = %b", $time, D, Q, QNot);
	$dumpfile ("test.vcd");
	$dumpvars(0,lab2bTest);
	#4 D = 1'b0;
	#4 D = 1'b1;
	#4 $finish();
	end
endmodule
