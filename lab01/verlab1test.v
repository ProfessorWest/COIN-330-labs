module verlab1test();
wire F;
reg[0:0]A;
reg[0:0]Bnot;
reg[0:0]C;
verlab1 uut(F,A,Bnot,C);

initial begin
	A = 1'b0;
	Bnot= 1'b0;
	C = 1'b0;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	A = 1'b1;
	Bnot= 1'b0;
	C = 1'b0;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	A = 1'b0;
	Bnot= 1'b1;
	C = 1'b0;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	A = 1'b0;
	Bnot= 1'b0;
	C = 1'b1;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	A = 1'b1;
	Bnot= 1'b1;
	C = 1'b0;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	A = 1'b1;
	Bnot= 1'b0;
	C = 1'b1;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	A = 1'b0;
	Bnot= 1'b1;
	C = 1'b1;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	A = 1'b1;
	Bnot= 1'b1;
	C = 1'b1;
	#1 $display("A = %b, Bnot = %b, C = %b, F = %b", A, Bnot, C, F);
	
	//I think this is sufficient because I have tested 
	//for on,1, or off,0, for every combination for A, Bnot, and C.
	
end
endmodule