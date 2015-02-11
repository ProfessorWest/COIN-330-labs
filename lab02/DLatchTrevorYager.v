module DLatchTrevorYager(D, OutQ, OutQNot);

output OutQ, OutQNot;
input D;

wire SNot;

not (SNot, D);
nand (OutQ, SNot, OutQNot);
nand (OutQNot, D, OutQ);

endmodule
