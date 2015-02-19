 //Matthew Timmons
 module lab2test(); 
 wire Q,Qnot; 
 reg [0:0] D; 
 lab2 uut (Q,QNot,D); 
 
 initial begin 
	D = 1'b0;
	#1 $display ("D = %b, Q = %b, QNot = %b",D,Q,QNot);
	D = 1'b1;
	#1 $display ("D = %b, Q = %b, QNot = %b",D,Q,QNot);
 end 
 endmodule 
