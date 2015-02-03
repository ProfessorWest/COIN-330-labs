module testlab01;

wire out;
reg inA, inB, inC;
lab01 testing(out, inA, inB, inC);

initial begin
	inA = 1'b1;
	inB = 1'b1;
	inC = 1'b1;
	#1 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	
	inA = 0'b1;
	inB = 0'b1;
	inC = 0'b1;
	#2 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	
	inA = 0'b1;
	inB = 0'b1;
	inC = 1'b1;
	#3 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	
	inA = 0'b1;
	inB = 1'b1;
	inC = 0'b1;
	#4 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	
	inA = 0'b1;
	inB = 1'b1;
	inC = 1'b1;
	#5 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	
	inA = 1'b1;
	inB = 0'b1;
	inC = 0'b1;
	#6 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	
	inA = 1'b1;
	inB = 0'b1;
	inC = 1'b1;
	#7 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	
	inA = 1'b1;
	inB = 1'b1;
	inC = 0'b1;
	#8 $display("inA=%b, inB=%b, inC=%b, out=%b", inA, inB, inC, out);
	end
endmodule
//this test is sufficient because it test every possible value for inputs
