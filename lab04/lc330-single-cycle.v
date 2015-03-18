`timescale 1ns/1ps

// Little Computer 330 Single Cycle
module lc330sc(clk, rst);
    input clk;
    input rst;

    reg [31:0] pc;
    reg [31:0] one;
    wire [31:0] nextPC;
    wire [31:0] instr;

    //wires added
    wire [31:0]sign_out;
    wire [31:0]sign_pc_out;
    wire [31:0]mux_to_pc_out;
    wire isEqual; //from ALU

    //decoder output bits
    wire [7:0] d3x8out;
    wire [6:0] rom_out;

    //mux and register
    wire [2:0] instr_mux_out;
    wire [31:0] ALU_mem_out;
    wire [31:0] reg_outA;
    wire [31:0] reg_outB;
    wire [31:0] sign_reg_out;
    wire [31:0] ALU_out;
    wire [31:0] data_mem_out;

    adder32 clockIncrement(pc, one, nextPC);

    instrmem instr_mem(pc, instr, clk, rst);

    signextend ex_instr(instr[15:0], sign_out);
    adder32 sign_adder(nextPC, sign_out, sign_pc_out);
    //beginning mux isEqual from ALU
    mux32bit mux_to_pc(mux_to_pc_out, nextPC, sign_pc_out, isEqual);

    //decoder and rom
    d3x8 opcode(instr[22], instr[23], instr[24], d3x8out[0] , d3x8out[1], d3x8out[2], d3x8out[3], d3x8out[4], d3x8out[5], d3x8out[6], d3x8out[7]);
    rom control(rom_out, d3x8out);

    //muxes and register file
    mux3bit instr_mux(instr_mux_out, instr[18:16], instr[2:0], rom_out[0]);
    mux32bit ALU_mem(ALU_mem_out, ALU_out, data_mem_out, rom_out[1]);
    regfile8x32r2w1 reg_file(instr[21:19], instr[18:16], instr_mux_out, rom_out[2], ALU_mem_out, reg_outA, reg_outB, clk, rst);
    mux32bit sign_reg(sign_out, reg_outB, sign_reg_out, rom_out[3]);

    //ALU and Data Mem
    alu ALU(reg_outA, sign_reg_out, rom_out[4], isEqual, ALU_out);
    datamem data(ALU_out, reg_outB, rom_out[5], rom_out[6], data_mem_out, clk, rst);


    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            pc <= 32'b00000000000000000000000000000000;
            one <= 32'b00000000000000000000000000000001;
	      end
        else begin
	           //$display("pc = %b, one = %b, nextPC = ??", pc-1, one);
            pc <= nextPC;
	      end
    end

    always @(instr) begin
        //HALT end everything
        if (instr[24:22] == 3'b110) begin
    	    $display("HALT instruction encountered, exiting...");
    	    $display("************END SIMULATION****************");
    	    $finish();
	      end
    end
endmodule
