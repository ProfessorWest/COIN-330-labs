module DFlipFlopTrevorYager(CLOCK, INPUTD, OUTPUTQ, OUTPUTQNOT);

output OUTPUTQ, OUTPUTQNOT;
input CLOCK, INPUTD;

wire NOT0, NOT1, NOT2, NAND0, NAND1, NAND2, NAND3, NAND4 ,NAND6;

not (NOT0, CLOCK);
not (NOT1, INPUTD);
not (NOT2, NAND1);

nand (NAND0, INPUTD, NOT0);
nand (NAND2, NOT0, NOT1);
nand (NAND1, NAND0, NAND3);
nand (NAND3, NAND2, NAND1);
nand (NAND6, NAND1, CLOCK);
nand (NAND4, NOT2, CLOCK);
nand (OUTPUTQ, NAND6, OUTPUTQNOT);
nand (OUTPUTQNOT, NAND4, OUTPUTQ);

endmodule
