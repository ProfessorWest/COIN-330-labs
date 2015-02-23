`timescale 1ns/1ns

module regfile8x32r2w1(inA, inB, dest, en, data, outA, outB, clk, reset);

    input [2:0] inA;		//3 bit input
    input [2:0] inB;		//3 bit input
    input [2:0] dest;	//3 bit destination reg to write to
    input clk;
    input reset;
    input [0:0] en;	//enable to write data 
    input [31:0] data;	//actual data to write

    output reg [31:0] outA;	//actual data in reg A
    output reg [31:0] outB;	//actual data in reg B

    reg [31:0] regs [7:0];

    always @ (posedge clk) begin
        if (reset == 1) begin
            regs[0] <= 32'h00000000;
            regs[1] <= 32'h00000000;
            regs[2] <= 32'h00000000;
            regs[3] <= 32'h00000000;
            regs[4] <= 32'h00000000;
            regs[5] <= 32'h00000000;
            regs[6] <= 32'h00000000;
            regs[7] <= 32'h00000000;
        end 
	$display("RegFile = [%h, %h, %h, %h, %h, %h, %h, %h]", regs[0], regs[1], regs[2], regs[3], regs[4], regs[5], regs[6], regs[7]);
    end

    always @ (posedge clk) begin
        if (en == 1) begin
            regs[dest] <= data;
	end
    end

    always @* begin
        outA <= regs[inA];
        outB <= regs[inB];
    end

endmodule
