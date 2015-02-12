`timescale 100ns/100ps
module lab02p2test();

reg clk = 0;
reg in1 = 0;

wire out;
wire nout;

always #1 clk = !clk;	//update clock

lab02p2 testing(in1, clk, out, nout);

initial begin
	#1 in1 = 1'b0;
	$monitor("in1=%b, clock=%b, out=%b, nout=%b", in1, $time, out, nout);
	$dumpfile("lab02test.vcd");
	$dumpvars(0,lab02p2);
	#2 in1= 1'b1;
	#2 in1= 1'b0;
	#12 $finish();	//simulation has finished
	end
endmodule
