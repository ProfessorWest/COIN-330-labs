`timescale 1ns/1ps 

// Little Computer 330 Single Cycle
module lc330sc(clk, rst);
    input clk;
    input rst;

    reg [31:0] pc;
    reg [31:0] one;
    wire [31:0] nextPC;
    wire [31:0] instr;
	wire [31:0] siexwire;
	wire [31:0] secondadd;
	wire [0:0] eq;
	wire [31:0] pcplusone;
	wire [7:0] w0;
	wire [6:0] romoutpt;
	wire [2:0] secondmuxout;
	wire [31:0] thirdmuxout;
	wire [31:0] fourthmuxout;
	wire [31:0] aluoutput;
	wire [31:0] datamemout;
	wire [31:0] regfia;
	wire [31:0] regfib;

		adder32 add(pc, one, pcplusone);
		instrmem theinstrmem(pc, instr, clk, rst);
		signextend siex(instr[15:0], siexwire);
		
		adder32 add2(pcplusone, siexwire, secondadd);
		mux32bit firstmux(nextPC, pcplusone, secondadd, eq); 
		d3x8 decoder(instr[24], instr[23], instr[22], w0[0], w0[1], w0[2], w0[3], w0[4], w0[5], w0[6], w0[7]);
		rom therom(romoutpt, w0);
		mux3bit mux2(secondmuxout, instr[18:16], instr[2:0], romoutpt[6]);
		mux32bit mux3(thirdmuxout,datamemout, aluoutput, romoutpt[5]);
		regfile8x32r2w1 regfiles( instr[18:16],instr[21:19], secondmuxout, romoutpt[4], thirdmuxout, regfia, regfib, clk, rst);
		mux32bit mux4(fourthmuxout,siexwire, regfib, romoutpt[3]);
		alu thealu(regfia, fourthmuxout, romoutpt[2], eq, aluoutput);
		datamem thedatamem(aluoutput, regfib, romoutpt[1], romoutpt[0], datamemout, clk, rst);
    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            pc <= 32'b00000000000000000000000000000000;
            one <= 32'b00000000000000000000000000000001;
	end else begin
			
			$display("pc = %b, one = %b, nextPC = %b, romoutpt=%b", pc, one, nextPC, romoutpt);
            pc <= nextPC;
			end
		end

    always @(instr) begin

		
        if (instr[24:22] == 3'b110) begin
	    $display("HALT instruction encountered, exiting...");
	    $display("************END SIMULATION****************");
	    $finish();
		end else begin
		

		
		
		end
	
    end

endmodule
