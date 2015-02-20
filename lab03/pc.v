module counter (clk, reset, count);

input		clk;
input		reset;
output	[31:0]	count;

reg	[31:0]	count;

always @(posedge clk)
	if (!reset)
		count = count + 1;
	else
		count = 0;
endmodule

