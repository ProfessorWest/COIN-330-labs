//Matthew Timmons
module lab2(Q,QNot,D);
output Q,QNot;
input D;

wire [0:0] DNot;

not(DNot[0], D);

nand(Q,DNot[0],QNot);
nand(QNot,D,Q);

endmodule