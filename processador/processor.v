module processor(
    input clk,
    input [15:0] iin,
    input resetn,
    output [15:0] bus
);
// Sinais internos
wire [1:0] counter_out;
wire [15:0] A_out, R_out, alu_result, immediate;
wire [7:0] regs_write_enable;
wire [1:0] alu_op;
wire [15:0] reg0_out, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out;
wire [3:0] mux_select;


// Instâncias dos módulos
counter cont(clk, clear, counter_out);

sign_extend se(iin[9:0],immediate);

alu alu(A_out, bus, alu_op, alu_result);

multiplexer mux(mux_select, immediate, reg0_out, reg1_out, reg2_out, reg3_out, reg4_out, reg5_out, reg6_out, reg7_out, R_out, bus);

control_unit ctrl(resetn, counter_out, iin, mux_select, regs_write_enable, alu_op, reg_A_enable, reg_R_enable, clear);

register_file r0(regs_write_enable[0], clk, bus, reg0_out);
register_file r1(regs_write_enable[1], clk, bus, reg1_out);
register_file r2(regs_write_enable[2], clk, bus, reg2_out);
register_file r3(regs_write_enable[3], clk, bus, reg3_out);
register_file r4(regs_write_enable[4], clk, bus, reg4_out);
register_file r5(regs_write_enable[5], clk, bus, reg5_out);
register_file r6(regs_write_enable[6], clk, bus, reg6_out);
register_file r7(regs_write_enable[7], clk, bus, reg7_out);
register_file reg_A(reg_A_enable, clk, bus, A_out);
register_file regR(reg_R_enable, clk, alu_result, R_out);

endmodule
