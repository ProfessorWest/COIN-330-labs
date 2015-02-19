module mux2to1test();
wire [31:0] C;
reg [31:0] A;
reg [31:0] B;
reg [0:0] Sel;
//mux2to1 firstbit(C,A[0],B[0],Sel);
mux32bit uut(C,A,B,Sel);
initial begin
  /*A[0] = 1'b0;
  B[0] = 1'b0;
  Sel = 1'b0;
  #1 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  A[0] = 1'b0;
  B[0] = 1'b1;
  Sel = 1'b0;
  #2 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  A[0] = 1'b1;
  B[0] = 1'b0;
  Sel = 1'b0;
  #3 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  A[0] = 1'b1;
  B[0] = 1'b1;
  Sel = 1'b0;
  #4 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  A[0] = 1'b0;
  B[0] = 1'b0;
  Sel = 1'b1;
  #5 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  A[0] = 1'b0;
  B[0] = 1'b1;
  Sel = 1'b1;
  #6 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  A[0] = 1'b1;
  B[0] = 1'b0;
  Sel = 1'b1;
  #7 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  A[0] = 1'b1;
  B[0] = 1'b1;
  Sel = 1'b1;
  #8 $display("A[0] = %b, B[0] = %b, Sel = %b, C = %b", A[0], B[0], Sel, C);
  */
  
  A=32'b00000000000000000000000000000100;
  B=32'b00000000000000000000000000000001;
  Sel = 1'b1;
  #9 $display("A = %b, B = %b, Sel = %b, C = %b", A, B, Sel, C);
end

endmodule
