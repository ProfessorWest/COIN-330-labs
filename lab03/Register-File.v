`timescale 1ns/1ns

module memories(inA, inB, dest, en, data, outA, outB);

input [2:0] inA;		//3 bit input
input [2:0] inB;		//3 bit input
input [2:0] dest;	//3 bit destination reg to write to
input clk;
input reset;
input [0:0] en;	//enable to write data 
input [31:0] data;	//actual data to write

output reg [31:0] outA;	//actual data in reg A
output reg [31:0] outB;	//actual data in reg B

reg [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;

always @ (posedge clk)
	if (reset)
	initial reg0 = 32'b0;
	initial reg1 = 32'b0;
	initial reg2 = 32'b0;
	initial reg3 = 32'b0;
	initial reg4 = 32'b0;
	initial reg5 = 32'b0;
	initial reg6 = 32'b0;
	initial reg7 = 32'b0;

always @(en)
	case (dest)
	3'b000:reg0=data;
	3'b001:reg1=data;
	3'b010:reg2=data;
	3'b011:reg3=data;
	3'b100:reg4=data;
	3'b101:reg5=data;
	3'b110:reg6=data;
	3'b111:reg7=data;
endcase

always@*
	case (inA)
	3'b000:assign outA=reg0;
	3'b001:assign outA=reg1;
	3'b010:assign outA=reg2;
	3'b011:assign outA=reg3;
	3'b100:assign outA=reg4;
	3'b101:assign outA=reg5;
	3'b110:assign outA=reg6;
	3'b111:assign outA=reg7;
endcase

always@*
	case (inB)
	3'b000:assign outB=reg0;
	3'b001:assign outB=reg1;
	3'b010:assign outB=reg2;
	3'b011:assign outB=reg3;
	3'b100:assign outB=reg4;
	3'b101:assign outB=reg5;
	3'b110:assign outB=reg6;
	3'b111:assign outB=reg7;
endcase	

endmodule
	
