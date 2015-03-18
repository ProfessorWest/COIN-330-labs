`timescale 1ns/1ps 

// Little Computer 330 Single Cycle
module lc330sc(clk, rst);
    input clk;
    input rst;

    reg [31:0] pc;
    reg [31:0] one;

    wire [31:0] nextPC;
    wire [31:0] instr;
    wire [31:0] adder2out;
    wire [31:0] pcinput;
    wire [31:0] extndout;
    wire [0:0] sel;       //selection bit
    wire [7:0] decodew;  //decoder output
    wire [6:0] romout;//rom output
    wire [2:0] mux3out; //3 bit mux output
    wire [31:0] regmuxout; //32 bit mux output by reg file
    wire [31:0] outa;   //32 bit output from reg-file
    wire [31:0] outb;   //second 32 bit output from reg-file
    wire [31:0] dmemout;    //data memory output
    wire [31:0] aluout; //alu output
    wire [31:0] mux4out //output from mux by alu


        signextend xtnd(instr[15:0], extndout);
        //sign extend

        mux32 m32(pcinput, extndout, nextpc, sel);
        //mux32

        adder32 stuff2(extndout, nextpc, adder2out);
        //adder32 bit

        d3x8 dcoder(instr[24],instr[23],instr[22], decodew[0],decodew[1],decodew[2],decodew[3],decodew[4],decodew[5],decodew[6],decodew[7]);
        //decoder

        rom myrom(romout,decodew);
        //rom

        regfile8x32r2w1 regfile(instr[21:19],instr[18:16], mux3out, romout[4], regmuxout, outa, outb, clk, rst);
        //register file

        mux3bit muxer(mux3out, instr[18:16], instr[2:0], romout[6]);
        //3 bit mux

        mux32bit regmux(regmuxout, dmemout, aluout, romout[5]);
        //mux by register file

        mux32bit alumux(mux4out, extndout, outb, romout[3]);
        //mux between alu and reg-file

        alu thealu(outa, mux4out, rom[2], sel, aluout);
        //alu

        datamem datamemory(aluout, outb, rom[1], rom[0], dmemout, clk, rst);
        //data memory

    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
            pc <= 32'b00000000000000000000000000000000;
            one <= 32'b00000000000000000000000000000001;
	end else begin //adder
	    //$display("pc = %b, one = %b, nextPC = ??", pc-1, one);
            adder32 stuff(one, pc, nextPC);
            pc <= pcinput;  //set pc to value from mux
	end
    end

    always @(instr) begin
        instrmem struction(pc, instr, clk, rst);    //initialize instruction memory

        if (instr[24:22] == 3'b110) begin
	    $display("HALT instruction encountered, exiting...");
	    $display("************END SIMULATION****************");
	    $finish();
	end
    end

endmodule
