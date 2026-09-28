module regfile(
input clk,// system clock
input RegWrite,//write data only on possedge
input [4:0] rs1,
input [4:0] rs2,
input [4:0] rd,
input [31:0] WriteData,
output [31:0] ReadData1,
output [31:0] ReadData2
);
reg [31:0] registers [31:0];
assign ReadData1=(rs1==5'd0) ? 32'd0 : registers[rs1];
assign ReadData2=(rs2==5'd0) ? 32'd0 : registers[rs2];
always @(negedge clk) begin
    if (RegWrite &&(rd!=5'd0)) begin
        registers[rd] <=WriteData;
    end
end
endmodule