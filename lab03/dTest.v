module decoderTest;

	reg a0,a1,a2;
	wire  o0,o1,o2,o3,o4,o5,o6,o7;
	d3x8 d1(a0,a1,a2,o0,o1,o2,o3,o4,o5,o6,o7);

	initial begin
		a0=1'b0;
		a1=1'b0;
		a2=1'b0;
#1
	$display("%b%b%b%b%b%b%b%b",o7,o6, o5, o4, o3, o2, o1, o0);

		a0=1'b1;
		a1=1'b0;
		a2=1'b0;
#1
	$display("%b%b%b%b%b%b%b%b",o7,o6,o5,o4,o3,o2,o1,o0);
	
		a0=1'b0;
		a1=1'b1;
		a2=1'b0;
#1
	$display("%b%b%b%b%b%b%b%b",o7,o6,o5,o4,o3,o2,o1,o0);

		a0=1'b0;
		a1=1'b0;
		a2=1'b1;
#1
	$display("%b%b%b%b%b%b%b%b",o7,o6,o5,o4,o3,o2,o1,o0);	

		a0=1'b1;
		a1=1'b1;
		a2=1'b1;
#1
	$display("%b%b%b%b%b%b%b%b",o7,o6,o5,o4,o3,o2,o1,o0);	
	end

endmodule