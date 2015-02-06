module trevor_yager_lab1_test();
wire Out;
reg InA, InB, InC;

trevor_yager_lab1 lab1(Out, InA, InB, InC);

initial begin
  InA = 1'b1;
  InB = 1'b1;
  InC = 1'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);

  InA = 1'b1;
  InB = 1'b1;
  InC = 0'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);

  InA = 1'b1;
  InB = 0'b1;
  InC = 1'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);

  InA = 1'b1;
  InB = 0'b1;
  InC = 0'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);

  InA = 0'b1;
  InB = 1'b1;
  InC = 1'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);

  InA = 0'b1;
  InB = 1'b1;
  InC = 0'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);

  InA = 0'b1;
  InB = 0'b1;
  InC = 1'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);

  InA = 0'b1;
  InB = 0'b1;
  InC = 0'b1;
  #1 $display("InA = %b, InB = %b, InC = %b, Out = %b", InA, InB, InC, Out);
end

endmodule
