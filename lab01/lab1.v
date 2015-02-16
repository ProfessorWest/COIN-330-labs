module lab1 (F, A, B, C);

	input A, B, C;
	output F;
	wire NotB, BC;

	not (NotB, B);
	and (BC, NotB, C);
	or (F, BC, A);



endmodule

