`timescale 1ns/1ps 

// Little Computer 330 Single Cycle
module lc330sc(clk, rst);
    input clk;
    input rst;

    reg [31:0] pc;
    reg [31:0] one;
    wire [31:0] nextPC;
    wire [31:0] instr;

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
