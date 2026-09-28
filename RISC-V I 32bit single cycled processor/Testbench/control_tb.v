`timescale 1ns / 1ps

module control_tb;

    reg  [6:0] opcode;
    wire       Branch;
    wire       MemRead;
    wire       MemToReg;
    wire [1:0] ALUOp;
    wire       MemWrite;
    wire       ALUSrc;
    wire       RegWrite;

    control uut (
        .opcode(opcode),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemToReg(MemToReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );

    initial begin
        $dumpfile("control_tb.vcd");
        $dumpvars(0, control_tb);

        // Test 1: R-type
        opcode = 7'b0110011;
        #10;

        // Test 2: Load (lw)
        opcode = 7'b0000011;
        #10;

        // Test 3: I-type (addi)
        opcode = 7'b0010011;
        #10;

        // Test 4: Store (sw)
        opcode = 7'b0100011;
        #10;

        // Test 5: Branch (beq)
        opcode = 7'b1100011;
        #10;

        $finish;
    end

endmodule