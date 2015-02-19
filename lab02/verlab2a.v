//Martin Hutchens
//Lab2 a:
module verlab2a(Q,Qnot,D);
output Q;
output Qnot;
input [0:0] D;
wire [0:0] dnot;

not (dnot[0],D[0]);
nand (Q,dnot[0], Qnot);
nand (Qnot, Q, D[0]);
endmodule
