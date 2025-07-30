// Converte imediato de 10 para 16 bits
module sign_extend(
    input [9:0] immediate, 
    output [15:0] extended
);

assign extended[9:0] = immediate;
assign extended[15:10] = {6{immediate[9]}};

endmodule
