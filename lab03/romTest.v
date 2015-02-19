`timescale 10ns/10ps
module romTest();
wire[6:0] out;
reg[7:0] one;
reg clk = 0;
always #1 clk = !clk;
rom uut(out,one,clk);

initial begin
one = 8'b00000001;
#2
#1 $display ("Out = %b", out);
one = 8'b00000010;
#2 $display ("Out = %b", out);
one = 8'b00000100;
#2 $display ("Out = %b", out);
one = 8'b00001000;
#2 $display ("Out = %b", out);
one = 8'b00010000;
#2 $display ("Out = %b", out);
one = 8'b00100000;
#2 $display ("Out = %b", out);
one = 8'b01000000;
#2 $display ("Out = %b", out);
$finish();
end
endmodule
