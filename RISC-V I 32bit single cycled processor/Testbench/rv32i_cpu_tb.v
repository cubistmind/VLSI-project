`timescale 1ns / 1ps

module cpu_tb;

    reg clk;
    reg reset;

    // Instantiate the Top-Level CPU
    rv32i_cpu uut (
        .clk(clk),
        .reset(reset)
    );

    // Generate a 10ns clock cycle (5ns high, 5ns low)
    always #5 clk = ~clk;

    initial begin
        // Setup GTKWave output
        $dumpfile("cpu_tb.vcd");
        $dumpvars(0, cpu_tb);

        // 1. Initialize clock and assert reset
        clk = 0;
        reset = 1;
        
        // Hold reset for 2 clock cycles to ensure PC clears to 0
        #20; 
        reset = 0;

        // 2. Let the CPU run the program for a set amount of time
        // (150ns is enough time to execute 15 instructions)
        #150;

        $finish;
    end

endmodule