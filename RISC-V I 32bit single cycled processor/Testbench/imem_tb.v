`timescale 1ns / 1ps
module imem_tb;
reg [31:0] a;
wire [31:0] rd;
imem uut(
.a(a),
.rd(rd)
);
initial begin 
    $dumpfile("imem_tb.vcd");
    $dumpvars(0,imem_tb);
    a=32'd0;
    #10;
    a=32'd4;
    #10;
    a=32'd8;
    #10;
    a=32'd12;
    #10;
    a=32'd16;
    #10;
    $finish;
end
endmodule