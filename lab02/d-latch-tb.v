module dlatchTb();

wire OutQ, OutQ_;
reg [1:0] In;
dlatch uut(In[0], OutQ, OutQ_);

initial begin
  In = 1'b0;
  #1 $display("D: %b, Qnext: %b, Qnext': %b", In[0], OutQ, OutQ_);
  In = 1'b1;
  #1 $display("D: %b, Qnext: %b, Qnext': %b", In[0], OutQ, OutQ_);
end


endmodule
