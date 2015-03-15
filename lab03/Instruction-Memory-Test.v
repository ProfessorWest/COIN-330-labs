module testiM();
 
	reg		clk;
	reg		[31:0] adding;
	output	[31:0] struction;
	instructmem IMtest(clk, adding, struction);
	initial begin
	

	clk = 1'b1;
	adding = 32'b1;
	#1 $display("clk=%b, adding=%b, struction=%b", clk, adding, struction);
	
end	
endmodule
