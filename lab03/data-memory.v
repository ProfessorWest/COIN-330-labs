module datamem(Ina, Inb, enable, readwrite, outstuff);

parameter addwidth =32;

input [addwidth-1:0] Ina;
input [31:0] Inb;
input [0:0] enable;
input [0:0] readwrite;

reg [31:0] memory[0:255];

output outstuff;

always @(enable or readwrite)
if(enable==1)
	case(readwrite)
	1'b1:memory[Ina]=Inb;
	endcase
assign outstuff=memory[Ina];
endmodule
