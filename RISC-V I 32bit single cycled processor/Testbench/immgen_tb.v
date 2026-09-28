`timescale 1ns/1ps
module immgen_tb;
reg [31:0] inst;
wire [31:0] imm;
immgen uut(
.inst(inst),
.imm(imm)
);
initial begin
    $dumpfile("immgen_tb.vcd");
    $dumpvars(0,immgen_tb);
        // Test 1: I-type -> addi x1, x0, -5 (Opcode: 0010011)
        // Machine code: 0xffb00093. Expect output: -5 (0xfffffffb)
        inst = 32'hffb00093;
        #10;

        // Test 2: S-type -> sw x2, 16(x3) (Opcode: 0100011)
        // Machine code: 0x0021a823. Expect output: 16 (0x00000010)
        inst = 32'h0021a823;
        #10;

        // Test 3: U-type -> lui x4, 0x12345 (Opcode: 0110111)
        // Machine code: 0x12345237. Expect output: 0x12345000
        inst = 32'h12345237;
        #10;
       $finish;
    end
endmodule 