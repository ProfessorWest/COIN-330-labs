module lab02(in1, out, nout);

input in1;
output out;
output nout;

wire w0;


not(w0, in1);
nand(nout, out, in1);
nand(out, w0, nout);

endmodule
