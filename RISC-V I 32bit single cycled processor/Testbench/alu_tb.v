`timescale 1ps/1ps
module alu_tb;
reg [31:0]A;
reg [31:0]B;
reg [3:0]ALUControl;
wire [31:0]Result;
wire zero;
alu uut(
.A(A),
.B(B),
.ALUControl(ALUControl),
.Result(Result),
.zero(zero)
);
initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0,alu_tb);
A=32'd5;
B=32'd10;
ALUControl=4'b0010;
#10;
A=32'd7;
B=32'd5;
ALUControl=4'b0000;
#10;
A=32'd9;
B=32'd11;
ALUControl=4'b0110;
#10;

A=32'd4;
B=32'd17;
ALUControl=4'b0001;
#10;
$finish;

end
endmodule
