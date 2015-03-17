`timescale 1ns/1ps 

// Little Computer 330 Single Cycle
module lc330sc(clk, rst);
    input clk;
    input rst;

    reg [31:0] pc;
    reg [31:0] one;	
    wire [31:0] nextPC;
    wire [31:0] instr;
	wire [31:0] signExtOut;
	wire [31:0] addToMux;
	wire [31:0] muxToPC;
	wire [7:0] o;
	wire [6:0] romOut;
	wire [2:0] mux3BOut;
	wire [31:0] outA;
	wire [31:0] outB;
	wire [31:0] muxToALU;
	wire [0:0] eq;
	wire [31:0] ALUout;
	wire [31:0] memOut;
	wire [31:0] mux32BOut;
	
	adder32 addPc1(one, pc, nextPC);
	instrmem instrMem(pc, instr, clk, rst);
	signextend signExt(instr[15:0], signExtOut);
	adder32 addPcSignExt(signExtOut, nextPC, addToMux);
	mux32bit muxPC(muxToPC, nextPC, addToMux, eq);
	d3x8 decoder3x8 (instr[22],instr[23],instr[24],o[0],o[1],o[2],o[3],o[4],o[5],o[6],o[7]);
	rom myRom(romOut,o);
	mux3bit mux3Bit(mux3BOut,instr[2:0],instr[16:18],romOut[0]);
	regfile8x32r2w1(instr[21:19], instr[18:16], mux3BOut, romOut[2], mux32BOut, outA, outB, clk, reset);
	mux32bit muxALU(muxToALU, signExtOut, outB, romOut[3]);
	alu myALU(outA, muxToALU, romOut[4], eq, ALUout);
	datamem(ALUout, outB, romOut[5], romOut[6], memOut, clk, rst);
	mux32bit mux32Bit(mux32BOut, memOut, ALUout, romOut[1]);
	
	
    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            pc <= 32'b00000000000000000000000000000000;
            one <= 32'b00000000000000000000000000000001;
	end else begin
	    //$display("pc = %b, one = %b, nextPC = ??", pc-1, one);
            pc <= nextPC;
	end
    end

    always @(instr) begin
        if (instr[24:22] == 3'b110) begin
	    $display("HALT instruction encountered, exiting...");
	    $display("************END SIMULATION****************");
	    $finish();
	end
    end

endmodule
