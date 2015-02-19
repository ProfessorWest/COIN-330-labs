module mux2to1(Out,A,B,Sel);
output Out;
input[0:0] A;
input[0:0] B;
input[0:0] Sel;

wire[0:0] NotSel;
wire[1:0] w; //x=w[0] y=w[1]

not (NotSel[0],Sel[0]);

and (w[0], A[0], NotSel[0]);
and (w[1], B[0], Sel[0]);
or (Out, w[0], w[1]);

endmodule

module mux32bit(Out,A,B,Sel);
output [31:0] Out;
input [31:0] A;
input [31:0] B;
input [0:0] Sel;

genvar i;
for(i=0;i<=31;i=i+1)
  begin
	mux2to1 uut(Out[i],A[i],B[i],Sel);
  end

endmodule	

module mux3bit(Out,A,B,Sel);
output [2:0] Out;
input [2:0] A;
input [2:0] B;
input [0:0] Sel;

genvar i;
for(i=0;i<=2;i=i+1)
  begin
	mux2to1 uut(Out[i],A[i],B[i],Sel);
  end

endmodule