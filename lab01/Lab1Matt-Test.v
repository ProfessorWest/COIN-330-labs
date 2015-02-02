module lab1test();
//this is a sufficent test because I have tested all of the possible
//binary combinations for A, B, and C.
wire Out;
reg [0:0] A;
reg [0:0] B;
reg [0:0] C;
lab1 uut (Out,A,B,C);

initial begin
	A = 1'b0;
	B = 1'b0;
	C = 1'b0;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);
	A = 1'b1;
	B = 1'b1;
	C = 1'b1;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);
	A = 1'b0;
	B = 1'b1;
	C = 1'b1;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);
	A = 1'b0;
	B = 1'b1;
	C = 1'b0;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);	
	A = 1'b0;
	B = 1'b0;
	C = 1'b1;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);
	A = 1'b1;
	B = 1'b0;
	C = 1'b0;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);
	A = 1'b1;
	B = 1'b0;
	C = 1'b1;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);
	A = 1'b1;
	B = 1'b1;
	C = 1'b0;
	#1 $display ("A = %b, B = %b, C = %b, Out = %b", A, B, C, Out);
end
endmodule