//Martin Hutchens
//Lab2 c:
module verlab2c(Q,Qnot,D,clk);
output Q;
output Qnot;
input [0:0] D;
input [0:0] clk;
wire [0:0] Dnot;
wire [0:0] clknot;
wire [0:0] a;
wire [0:0] b;
wire [0:0] c;
wire [0:0] cnot;
wire [0:0] d;
wire [0:0] e;
wire [0:0] f; 

not (clknot[0],clk[0]);
not (Dnot[0],D[0]);
nand (a[0],D[0],clknot[0]);
nand (b[0],Dnot[0],clknot[0]);

nand (c[0],a[0],d[0]);
nand (d[0],b[0],c[0]);

not (cnot[0],c[0]);
nand (e[0],c[0],clk[0]);
nand (f[0],cnot[0],clk[0]);

nand (Q,e[0],Qnot);
nand (Qnot,f[0],Q);
endmodule
