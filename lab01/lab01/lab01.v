module lab01 (out, inA, inB, inC);

input inA, inB, inC;
output out;
wire w0, bnot;


not (bnot, inB);		//set bnot to the not of b

and(w0, bnot, inC);		//set w0 to the and of bnot and inC

or(out, w0, inA);		//set out to the or of w0 and inA

endmodule