module multiplexer(
    input wire [3:0] sel,
    input wire [15:0] imm,
    input wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7,
    input wire [15:0] r,
    output reg [15:0] out
);
always @(*) begin
    case(sel)
        4'b0000: out = r0;
        4'b0001: out = r1;
        4'b0010: out = r2;
        4'b0011: out = r3;
        4'b0100: out = r4;
        4'b0101: out = r5;
        4'b0110: out = r6;
        4'b0111: out = r7;
        4'b1000: out = imm;
        4'b1001: out = r;
        default: out = 16'dz;
    endcase
end
endmodule
