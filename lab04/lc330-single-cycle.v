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
	wire [31:0] inputofthepc;
	wire [7:0] w0;
	wire [6:0] romoutpt;
	wire [2:0] secondmuxout;
	wire [31:0] thirdmuxout;
	wire [31:0] fourthmuxout;
	wire [31:0] aluoutput;
	wire [31:0] datamemout;
	wire [31:0] regfia;
	wire [31:0] regfib;

		adder32 add(pc, one, nextPC);
		signextend siex(instr[15:0], siexwire);
		
		adder32 add2(nextPC, siexwire, secondadd);
		mux32bit firstmux(inputofthepc,nextPC, secondadd, eq); 
		d3x8 decoder(instr[22], instr[23], instr[24], w0[0], w1[1], w0[2], w0[3], w0[4], w0[5], w0[6], w0[7]);
		rom therom(romoutpt, w0);
		mux3bit mux2(secondmuxout, instr[18:16], instr[2:0], romoutpt[0]);
		mux32bit mux3(thirdmuxout,datamemout, aluoutput, romoutpt[1]);
		regfile8x32r2w1 regfiles(instr[21:19], instr[18:16], secondmuxout, romoutpt[2], thirdmuxout, regfia, regfib, clk, rst);
		mux32bit mux4(fourthmuxout,siexwire, regfib, romoutpt[3]);
		alu thealu(regfia, fourthmuxout, romoutpt[4], eq, aluoutput);
		datamem thedatamem(aluoutput, regfib, romoutpt[5], romoutpt[6], datamemout, clk, rst);
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
		end else begin
		

		
		
		end
	
    end

endmodule
