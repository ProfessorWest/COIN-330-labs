module rom(data,addr,clk);
	 input [7:0] addr;
	 output reg[6:0] data;
	 input clk;
     always @(posedge clk)
        case(addr)
			8'b00000001: data = 7'b111100X; //add
			8'b00000010: data = 7'b111110X; //nand
			8'b00000100: data = 7'b0010010; // lw
			8'b00001000: data = 7'bXX00011; //sw
			8'b00010000: data = 7'bXX01X0X; //beq
			//8'b00010000: for mult
			8'b00100000: data = 7'bXX0XX0X; //halt
			8'b01000000: data = 7'bXX0XX0X; //no op
			default: data = 7'bXXXXXXX;
			
		endcase
		
	 endmodule
