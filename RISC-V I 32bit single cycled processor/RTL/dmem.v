module dmem(
input clk,
input MemWrite,
input MemRead,
input [31:0] addr,
input [31:0] write_data,
input [31:0] read_data
);
reg [31:0] RAM [0:63];
always @(posedge clk) begin
    if (MemWrite) begin
        RAM[addr[31:2]] <=write_data;
    end
end
assign read_data = (MemRead) ? RAM[addr[31:2]] : 32'd0;
endmodule