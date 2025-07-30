module control_unit(
    input resetn,
    input [1:0] counter,
    input [15:0] instruction,
    output reg [3:0] mux_select,
    output [7:0] regs_write_enable,
    output [1:0] alu_op,
    output reg_A_enable,
    output reg_R_enable,
    output reg clear
);

`define REP 3'b111
`define ADD 3'b000
`define SUB 3'b001
`define NAN 3'b010
`define LDI 3'b101
`define OUT 3'b100

`define ALU_OPERATION (opcode == `ADD || opcode == `SUB || opcode == `NAN)

reg [2:0] opcode, rx, ry;

// Decodificador one-hot para registradores
wire [7:0] regs_decode;
decode dec(rx, regs_decode);


assign reg_A_enable = (counter == 2'b01 && `ALU_OPERATION);

assign reg_R_enable = (counter == 2'b10 && `ALU_OPERATION);

assign alu_op = (`ALU_OPERATION) ? opcode[1:0] : 2'b11;

assign regs_write_enable = (counter == 2'b11 && opcode != `OUT) ? regs_decode : 8'b00000000;

// Lógica de controle por ciclo
always @(counter) begin

	case(counter)
		2'b00: begin 
			mux_select <= 4'b1111;
		end 
		    
		2'b01: begin
			opcode = instruction[15:13];
			rx = instruction[12:10];
			ry = instruction[9:7];
			
			if(`ALU_OPERATION)
			   mux_select <= {1'b0, rx};
		end
				   
		2'b10: begin
			if(`ALU_OPERATION)
			   mux_select <= {1'b0, ry};
		end
		    
		2'b11: begin
			case(opcode)
				`OUT : mux_select <= {1'b0, rx};
				`REP : mux_select <= {1'b0, ry};
				`LDI : mux_select <= 4'b1000;
				default: mux_select <= 4'b1001;
			endcase		
		end
	 endcase
end

always @(negedge resetn)
begin
   clear = 1'b0;
end

endmodule
