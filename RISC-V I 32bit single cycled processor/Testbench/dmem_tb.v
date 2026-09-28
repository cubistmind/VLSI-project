`timescale 1ns / 1ps

module dmem_tb;

    reg         clk;
    reg         MemWrite;
    reg         MemRead;
    reg  [31:0] addr;
    reg  [31:0] write_data;
    wire [31:0] read_data;

    dmem uut (
        .clk(clk),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Generate 10ns clock cycle
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dmem_tb.vcd");
        $dumpvars(0, dmem_tb);

        // 1. Initialize
        clk = 0;
        MemWrite = 0;
        MemRead = 0;
        addr = 0;
        write_data = 0;
        #10;

        // 2. Store 0xDEADBEEF to byte address 4 (Word index 1)
        MemWrite = 1;
        MemRead = 0;
        addr = 32'd4;
        write_data = 32'hDEADBEEF;
        #10; // Clock edge writes data

        // 3. Load from byte address 4
        MemWrite = 0;
        MemRead = 1;
        addr = 32'd4;
        #10;

        // 4. Load from uninitialized byte address 8
        addr = 32'd8;
        #10;

        $finish;
    end

endmodule