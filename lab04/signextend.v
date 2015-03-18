module signextend(in, out);
    input [15:0] in;
    input clk;
    output [31:0] out;

    //concatinate {,}, and replicate{{}}!
    assign out = {{16{in[15]}},in};
endmodule
