module lab1_tb();
wire Out;
reg [2:0] In;
lab1 uut(Out, In[0], In[1], In[2]);

initial begin
  In = 3'b000;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
  In = 3'b001;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
  In = 3'b010;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
  In = 3'b011;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
  In = 3'b100;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
  In = 3'b101;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
  In = 3'b110;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
  In = 3'b111;
  #1 $display("A: %b, B: %b, C: %b,  Out: %b", In[0], In[1], In[2], Out);
end

/*
This test bench is sufficient because it tests all possible combination
of inputs into the circuit and result in correct outputs.
*/

endmodule
