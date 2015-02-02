module verlab1(F,A,Bnot,C);
output F;
input[0:0] A;
input[0:0] Bnot;
input[0:0] C;
wire[0:0] x;

and (x[0], Bnot[0], C[0]);
or (F, A[0], x[0]);

endmodule