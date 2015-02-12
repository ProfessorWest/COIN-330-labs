module lab02p2(in1, timeclk, out, nout);

input in1;
input timeclk;

output out;
output nout;

wire w0, w1, w2, not3, w4, w5, w6, w7, notclk;

not(w0,in1);
not(notclk, timeclk);

nand(w1, in1, notclk);
nand(w2, w0, notclk);

nand(w4, w2, w3);
nand(w3, w1, w4);

nand(w5, w3, timeclk);
not(not3, w3);

nand(w6, not3, timeclk);
nand(nout, w6, out);
nand(out, w5, nout);

endmodule
