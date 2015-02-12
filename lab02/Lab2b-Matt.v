module Lab2b(D,clk,Q,QNot);
output Q,QNot;
input [0:0] D;
input [0:0] clk;
wire [0:0] DNot;
wire [0:0] CNot;
wire [0:0] one;
wire [0:0] two;
wire [0:0] three;
wire [0:0] threeNot;
wire [0:0] four;
wire [0:0] five;
wire [0:0] six;


not(cNot[0], clk);
not(DNot[0], D);

nand(one[0],D,CNot[0]);
nand(two[0],DNot[0],CNot[0]);

nand(three[0],one[0],four[0]);
nand(four[0],two[0],three[0]);

not(threeNot[0],three[0]);
nand(five[0],three[0], clk);
nand(six[0],threeNot[0],clk);

nand(Q,five[0],QNot);
nand(QNot,six[0],Q);

endmodule