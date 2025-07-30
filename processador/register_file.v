module register_file(
    input write_enable,
    input clk,
    input [15:0] data_in,
    output reg [15:0] reg_out
);

// Escrita síncrona
	integer i;
	always @(posedge clk) begin
      		if(write_enable) 
      			reg_out <= data_in;
	end
endmodule


