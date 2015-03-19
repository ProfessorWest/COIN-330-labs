module lc330sstb();
    reg clk;
    reg rst;

    lc330sc cpu(clk, rst);

    always #1 clk = !clk;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,lc330sstb);
        rst <= 1'b1; // hole reset
	clk <= 0'b0; // initializae the clock.
	$display("***********HOLD RESET LINE****************");
	#10  // for 10 ticks
	rst <= 1'b0; // release the reset line
	$display("***********BEGIN SIMULATION***************");
	//#10 $finish(); // Remove once your PC+1 is working!
    end

endmodule
