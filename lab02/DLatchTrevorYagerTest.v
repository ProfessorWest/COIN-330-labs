module DLatchTrevorYagerTest();

wire OutQ, OutQNot;
reg [1:0] D;

DLatchTrevorYager lab2(D[0], OutQ, OutQNot);

initial begin
  D = 2'b0;
  #1 $display("D = %b, OutQ = %b, OutQNot = %b", D[0], OutQ, OutQNot);

  D = 2'b1;
  #1 $display("D = %b, OutQ = %b, OutQNot = %b", D[0], OutQ, OutQNot);
end

endmodule
