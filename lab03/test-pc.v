module testpc();

	reg		clk;
	reg		reset;
	output	[31:0] cnt;
	counter pctest(clk, reset, cnt);
	initial begin
	

	clk = 1'b1;
	reset = 1'b1;
	#1 $display("cnt=%b, clk=%b, reset=%b", cnt, clk, reset);
	
end	
endmodule
