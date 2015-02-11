module dFlipFlop(InD, clock, slaveQ, slaveQ_);

output slaveQ, slaveQ_;//outputs of flip flop (2nd d-latch)
input InD, clock;

wire notD, notClk, notD_Notclk, D_Notclk;//output of invert D also known as s'
wire masterQ, masterQ_;//outputs of first d-latch

//start first latch
not(notClk, clock);//invert clock
not(notD, InD);//invert D

nand(D_Notclk, InD, notClk);//D nand clock'
nand(notD_Notclk, notD, notClk);//D' nand clock'
nand(masterQ, D_Notclk, masterQ_);//(D nand clock') nand Q'
nand(masterQ_, notD_Notclk, masterQ);//(D' nand clock') nand Q
//end first latch

//start second latch
wire notmasterQ, masterQ_clk, notmasterQ_clk; //wires for second latch

not(notmasterQ, masterQ);

nand(masterQ_clk, masterQ, clock);
nand(notmasterQ_clk, notmasterQ, clock);
nand(slaveQ, masterQ_clk, slaveQ_);
nand(slaveQ_, notmasterQ_clk, slaveQ);
//end second latch
endmodule
