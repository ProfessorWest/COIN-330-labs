//Martin Hutchens
//Lab2 b:
module verlab2atest();
wire Q;
wire Qnot;
reg[0:0]D;
verlab2a uut(Q,Qnot,D);

initial begin
	D = 1'b0;
	#1 $display("D = %b, Q = %b, Qnot = %b", D, Q, Qnot);
	D = 1'b1;
	#1 $display("D = %b, Q = %b, Qnot = %b", D, Q, Qnot);
end
endmodule


//iverilog *.v
//vvp a.out
