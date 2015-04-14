`timescale 1ns/1ps 

// Little Computer 330 Single Cycle
module lc330sc(clk, rst);
    input clk;
    input rst;

    reg [31:0] pc;
    reg [31:0] one;
    wire [31:0] nextPC;
    wire [31:0] instr;
    wire [31:0] ext;
    wire [31:0] plusPC;
	wire [31:0] addtwo;
	wire [31:0] toPC;
	wire [0:0] eq;
	wire [6:0] romOut;
	wire [2:0] mux3out;
	wire [7:0] out;
	wire[31:0] aluOut;
	wire[31:0] dataOut;
	wire[31:0] regIn;
	wire [31:0] outA;
	wire [31:0] outB;
	wire [31:0] toAlu;
	adder32 addPC(one, pc, plusPC);
	instrmem instruct(pc, instr, clk, rst);
	signextend extend(instr[15:0], ext);
	adder32 add2(plusPC, ext, addtwo);
	mux32bit pcMux(nextPC,plusPC,addtwo,eq);
	mux3bit Mux3(mux3out,instr[18:16],instr[2:0],romOut[6]);
	d3x8 decoder(instr[24],instr[23],instr[22],out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]);
	rom Rom(romOut,out);
	mux32bit regMux(regIn,aluOut,dataOut,romOut[1]);
	regfile8x32r2w1 refFile(instr[18:16], instr[21:19], mux3out, romOut[4], regIn, outA, outB, clk, reset);
	mux32bit muxToAlu(toAlu,ext,outB,romOut[3]);
	alu theAlu(outA, toAlu, romOut[2], eq, aluOut);
	datamem dataMem(aluOut, outB, romOut[1], romOut[0], dataOut, clk, rst);
	
    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            pc <= 32'b00000000000000000000000000000000;
            one <= 32'b00000000000000000000000000000001;
	end else begin
	    $display("pc = %b, one = %b, nextPC = %b", pc-1, one,nextPC);
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
