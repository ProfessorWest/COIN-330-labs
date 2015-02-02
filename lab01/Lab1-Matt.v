module lab1 (Out,A,B,C);
output Out;
input [0:0] A;
input [0:0] B;
input [0:0] C;
wire [0:0] Y;

and(Y[0],B[0], C[0]);

or(Out, Y[0], A[0]);

endmodule


