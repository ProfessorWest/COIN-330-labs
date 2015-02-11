module dlatch(InD, OutQ, OutQ_);

output OutQ, OutQ_;
input InD;

wire notD;//output of invert D also known as s'

not(notD, InD);

nand(OutQ, notD, OutQ_);
nand(OutQ_, InD, OutQ);

endmodule
