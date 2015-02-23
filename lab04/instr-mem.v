module instrmem(addr, instr, clk, rst);

    input clk, rst;
    input [31:0] addr;
    output reg [31:0] instr;

    reg [31:0] mem[0:65535];

    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
	    instr <= 32'hfff00000; //noop
            $readmemh ("prg.bin", mem);
	end else begin
            instr <= mem[addr];
	end
    end

endmodule
