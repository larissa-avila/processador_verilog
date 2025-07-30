// Contador de 2 bits para controlar os estágios de execução
module counter(
    input clock,         
    input clear,       
    output reg [1:0] out 
);
always @(clear)
    out <= 2'b00;
    
always @(posedge clock)
    out <= out + 2'b01;
endmodule
