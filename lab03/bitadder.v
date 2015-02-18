module oneBitAdder(A, B, sum, cin, cout);
  input A, B, cin;
  output sum, cout;

  wire AB, AxorBcin, AxorB;

  xor(AxorB, A, B);
  xor(sum, AxorB, cin);//sum out

  and(AxorBcin, AxorB, cin);
  and(AB, A , B);
  or(cout, AxorBcin, AB);//carry out
endmodule

module Fulladder(A, B, sum);
  input [31:0] A, B;
  output [31:0] sum;
  output [32:0] cout;
  assign cout[0] = 0;

  genvar i;
  for(i = 0; i < 32; i = i+1) begin
    oneBitAdder uut(A[i], B[i], sum[i], cout[i], cout[i+1]);
  end

  //easy way
  //assign sum = A + B;
endmodule
