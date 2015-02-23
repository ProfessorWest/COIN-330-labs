CPU_FILES=instr-mem.v lc330-single-cycle.v adders.v d3x8.v rom.v mux.v register-file.v signextend.v alu.v data-memory.v
TEST_FILE=lc330-single-cycle-tb.v

all: assembler
	iverilog ${CPU_FILES} ${TEST_FILE} && vvp a.out

assembler: a.c
	gcc -O2 -o lc330-asm a.c

clean:
	rm -f lc330-asm a.out *.vcd *.bin
