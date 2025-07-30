// Unidade Lógico-Aritmética
module alu(
    input [15:0] A,    // Operando A
    input [15:0] B,    // Operando B
    input [1:0] op,    // Código da operação
    output reg [15:0] result
);
always @(*) begin
    case(op)
        2'b00: result = A + B; // ADD
        2'b01: result = A - B; // SUB
        2'b10: result = ~(A & B); // NAND
        2'b11: result = 16'dz;  //não faz operacao
    endcase
end
endmodule
