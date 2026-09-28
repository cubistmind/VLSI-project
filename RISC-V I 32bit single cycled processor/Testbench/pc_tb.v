`timescale 1ns/1ps
module pc_tb;
reg clk;
reg reset;
reg [31:0] pc_in;
wire [31:0] pc_out;
pc uut(
.clk(clk),
.reset(rest),
.pc_in(pc_in),
.pc_out(pc_out)
);
always #5 clk=~clk;
initial begin 
    $dumpfile("pc.vcd");
    $dumpvars(0,pc_tb);
         clk = 0;
        reset = 1; // Assert reset initially
        pc_in = 32'd0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Simulate PC + 4 increments
        pc_in = 32'd4;   // PC = 4
        #10;

        pc_in = 32'd8;   // PC = 8
        #10;

        pc_in = 32'd12;  // PC = 12
        #10;

        // Test Reset during operation
        reset = 1;
        #10;

        reset = 0;
        pc_in = 32'd4;
        #10;

        $finish;
    end

endmodule
