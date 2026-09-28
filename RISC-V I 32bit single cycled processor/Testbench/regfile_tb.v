`timescale 1ns / 1ps
module regfile_tb;
reg clk;
reg RegWrite;
reg [4:0]rs1;
reg [4:0]rs2;
reg [4:0]rd;
reg [31:0]WriteData;
wire [31:0]ReadData1;
wire [31:0]ReadData2;
regfile uut(
.clk(clk),
.RegWrite(RegWrite),
.rs1(rs1),
.rs2(rs2),
.rd(rd),
.WriteData(WriteData),
.ReadData1(ReadData1),
.ReadData2(ReadData2)
);
always #5 clk=~clk;
initial begin 
    $dumpfile("regfile.vcd");
    $dumpvars(0,regfile_tb);
    clk=0;
    RegWrite = 0;
    rs1 = 0;
    rs2 = 0;
    rd = 0;
     WriteData = 0;
    #10;

// 2. Write the value 99 into register 5 (x5)
    RegWrite = 1;
    rd = 5'd5;
    WriteData = 32'd99;
    #10; // Wait for clock edge to process the write

        // 3. Read from register 5 to see if 99 comes out
    RegWrite = 0; // Turn off writing
     rs1 = 5'd5;
    #10;

        // 4. Try to write the value 500 into register 0 (x0)
    RegWrite = 1;
    rd = 5'd0;
    WriteData = 32'd500;
    #10;

        // 5. Read from register 0 to ensure it is still 0, not 500
    RegWrite = 0;
    rs2 = 5'd0;
    #10;
    $finish;
end 
endmodule