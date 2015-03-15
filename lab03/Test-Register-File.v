module testmemories;

reg [2:0] inA;
reg [2:0] inB; 
reg [2:0] dest; 
reg [0:0] en;
reg [31:0] data;
output [31:0] outA;
output [31:0] outB;

	
memories testing(inA, inB, dest, en, data, outA, outB);

initial begin
	inA = 3'b000;
	inB = 3'b001;
	dest = 3'b101;
	en = 1'b1;
	data = 32'b00000000000000000000000000000111;
	#1 $display ("inA = %b, inB = %b, dest = %b, en = %b, data = %b,outA = %b,outB = %b", inA, inB, dest, en, data, outA, outB);
end

endmodule
