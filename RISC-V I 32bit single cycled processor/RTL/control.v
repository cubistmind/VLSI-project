module control(
    input  [6:0] opcode,
    output reg   Branch,
    output reg   MemRead,
    output reg   MemToReg,
    output reg [1:0] ALUOp,
    output reg   MemWrite,
    output reg   ALUSrc,
    output reg   RegWrite
);

    always @(*) begin
        case (opcode)
            // R-type instructions (add, sub, and, or, slt)
            7'b0110011: begin
                RegWrite = 1'b1;
                ALUSrc   = 1'b0;
                MemToReg = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end

            // I-type Load (lw)
            7'b0000011: begin
                RegWrite = 1'b1;
                ALUSrc   = 1'b1;
                MemToReg = 1'b1;
                MemRead  = 1'b1;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

            // I-type ALU (addi, andi, ori)
            7'b0010011: begin
                RegWrite = 1'b1;
                ALUSrc   = 1'b1;
                MemToReg = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end

            // S-type Store (sw)
            7'b0100011: begin
                RegWrite = 1'b0;
                ALUSrc   = 1'b1;
                MemToReg = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b1;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

            // B-type Branch (beq, bne)
            7'b1100011: begin
                RegWrite = 1'b0;
                ALUSrc   = 1'b0;
                MemToReg = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b1;
                ALUOp    = 2'b01;
            end

            // Default / Unrecognized instruction
            default: begin
                RegWrite = 1'b0;
                ALUSrc   = 1'b0;
                MemToReg = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end
        endcase
    end

endmodule