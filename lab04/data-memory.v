module datamem(Ina, Inb, enable, readwrite, dataOut, clk, rst);

    input [31:0] Ina;
    input [31:0] Inb;
    input [0:0] enable;
    input [0:0] readwrite;
    input clk;
    input rst;

    reg [31:0] memory[0:65535];

    output [31:0] dataOut;

    assign dataOut = (!rst && enable) ? memory[Ina] : 32'hzzzzzzzz;

    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            $readmemh ("prg.bin", memory);
	end 
	if (readwrite && enable) begin
	    //memory[Inb] <= Ina; 
		memory[Ina] <= Inb;
	end
    end

endmodule
