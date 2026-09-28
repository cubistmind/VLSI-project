module imem(
    input [31:0] a,
    output [31:0] rd
);
reg [31:0] RAM [0:1023];
initial begin 
    $readmemh("instructions.hex",RAM);
end
assign rd = RAM[a[31:2]];
endmodule
