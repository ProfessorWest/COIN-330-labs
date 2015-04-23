`timescale 1ns/1ps

// Little Computer 330 Single Cycle
module lc330sc(clk, rst);
  input clk;
  input rst;

  reg [31:0] pc;
  reg [31:0] one;
  wire [31:0] nextPC;
  wire [31:0] instr;
  wire [31:0] signExt;
  wire [31:0] pcMuxInput2;
  wire [31:0] inPC;
  wire [0:0] equalBit;
  wire [7:0] decoder;
  wire [6:0] romData;
  wire [2:0] regFileMuxInput1;
  wire [31:0] regFileMuxInput2;
  wire [31:0] aluOutput;
  wire [31:0] dataMemoryOutput;
  wire [31:0] regFileOut0;
  wire [31:0] regFileOut1;
  wire [31:0] aluMuxOutput;

  //AdderPC
  adder32 pcAdderMux(.A(pc), .B(one), .sum(nextPC));

  //SignExtend
  signextend signExtend(.in(instr[15:0]), .out(signExt));

  //InstructionMemory
  instrmem instrMem(.addr(pc), .instr(instr), .clk(clk), .rst(rst));

  //AdderPC
  adder32 pcAdderAdder(.A(nextPC), .B(signExt), .sum(pcMuxInput2));

  //Decoder
  d3x8 decoder3x8(.i0(instr[24]), .i1(instr[23]), .i2(instr[22]), .o0(decoder[0]), .o1(decoder[1]), .o2(decoder[2]), .o3(decoder[3]), .o4(decoder[4]), .o5(decoder[5]), .o6(decoder[6]), .o7(decoder[7]));

  //ROM
  rom controlROM(.data(romData), .addr(decoder));

  //regFileMux
  mux3bit regMux1(.Out(regFileMuxInput1), .A(instr[18:16]), .B(instr[2:0]), .Sel(romData[6]));
  mux32bit regMux2(.Out(regFileMuxInput2), .A(aluOutput), .B(dataMemoryOutput), .Sel(romData[5]));

  //regFile
  regfile8x32r2w1 regFile(.inA(instr[18:16]), .inB(instr[21:19]), .dest(regFileMuxInput1), .en(romData[4]), .data(regFileMuxInput2), .outA(regFileOut0), .outB(regFileOut1), .clk(clk), .reset(rst));

  //aluMux
  mux32bit aluMux(.Out(aluMuxOutput), .A(signExt), .B(regFileOut1), .Sel(romData[3]));

  //ALU
  alu alulu(.A(regFileOut0), .B(aluMuxOutput), .op(romData[2]), .eq(equalBit), .out(aluOutput));

  //DateMemory
  datamem dataMemory(.Ina(aluOutput), .Inb(regFileOut1), .enable(romData[1]), .readwrite(romData[0]), .dataOut(dataMemoryOutput), .clk(clk), .rst(rst));

  //pcMux
  mux32bit muxToPC(.Out(inPC), .A(pcMuxInput2), .B(nextPC), .Sel(equalBit));

  always @(posedge clk, posedge rst) begin
    if (rst == 1) begin
      pc <= 32'b00000000000000000000000000000000;
      one <= 32'b00000000000000000000000000000001;
    end
    else begin
      $display("pc = %b, one = %b, nextPC = %b", pc, one, nextPC);
      pc <= nextPC;
    end
  end

  always @(instr) begin
    if (instr[24:22] == 3'b110) begin
	    $display("HALT instruction encountered, exiting...");
	    $display("************END SIMULATION****************");
	    $finish();
    end
    else begin

    end
  end
endmodule
