module mux2to1test();
wire [31:0] C32;
wire [2:0] C3;
reg [31:0] A32;
reg [2:0] A3;
reg [0:0] A;
reg [31:0] B32;
reg [2:0] B3;
reg [0:0] B;
reg [0:0] Sel;
//mux2to1 firstbit(C,A[0],B[0],Sel);
//mux32bit bit32(C32,A32,B32,Sel);
mux3bit bit3 (C3,A3,B3,Sel);
initial begin
  /*//1 bit test
  A[0] = 1'b0;
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
  
  /*//32 bit test
  A32=32'b00000000000000000000000000000100;
  B32=32'b00000000000000000000000000000001;
  Sel = 1'b1;
  #9 $display("A = %b, B = %b, Sel = %b, C32 = %b", A32, B32, Sel, C32);
  */
  
  //3 bit test
  A3=3'b010;
  B3=3'b001;
  Sel=1'b1;
  #9 $display("A = %b, B = %b, Sel = %b, C3 = %b", A3, B3, Sel, C3);
  A3=3'b010;
  B3=3'b101;
  Sel=1'b0;
  #9 $display("A = %b, B = %b, Sel = %b, C3 = %b", A3, B3, Sel, C3);
  A3=3'b110;
  B3=3'b001;
  Sel=1'b1;
  #9 $display("A = %b, B = %b, Sel = %b, C3 = %b", A3, B3, Sel, C3);

end

endmodule