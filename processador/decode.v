module decode (
    input [2:0] registrador,
    output reg [7:0] output_reg
);

    always @(*) begin
        case(registrador)
            3'b000: output_reg = 8'b00000001; //r0 
            3'b001: output_reg = 8'b00000010; //r1
            3'b010: output_reg = 8'b00000100; //r2
            3'b011: output_reg = 8'b00001000; //r3
            3'b100: output_reg = 8'b00010000; //r4
            3'b101: output_reg = 8'b00100000; //r5
            3'b110: output_reg = 8'b01000000; //r6
            3'b111: output_reg = 8'b10000000; //r7
        endcase
    end

endmodule
