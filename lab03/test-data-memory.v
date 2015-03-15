module testdata();

reg [31:0] inA;
reg [31:0] inB;
reg [0:0] en;
reg [0:0] rw;
output [31:0] cout;

datamem testing(inA, inB, en, rw, cout);

initial begin

inA = 32'b0;
inB = 32'b1;	
en = 1'b0;
rw = 1'b1;

#1 $display("inA=%b, inB=%b, en=%b, rw=%b, cout=%b", inA, inB, en, rw, cout);
end 
endmodule
