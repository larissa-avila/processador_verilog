module testbench;
reg clk = 0;
reg [15:0] lin;
reg resetn = 1;
wire [15:0] bus;

// Geração de clock (período 2 unidades)
always #1 clk = !clk;

initial $dumpfile("testbench.vcd");
initial $dumpvars(0, testbench);
    
processor p(clk, lin, resetn, bus);

initial begin

    # 0 resetn = 1'b0;  // 2 ciclos de clock
    
    # 8 lin = 16'b1010000000011100;  // LDI r0, #28
    
    # 8 lin = 16'b1010010000001010;  // LDI r1, #10
    
    # 8 lin = 16'b0010000010000000; // SUB r0, r1
    
    # 8 lin = 16'b1000000000000000; // OUT r0
    
    # 8 $finish;
    
end
endmodule
