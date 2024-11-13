`timescale 1ns / 1ns
module tb_JK_FF;
    reg J, K, clk, reset;
    wire Q;
    JK_FF dut (
        .j(J),
        .k(K),
        .clk(clk),
        .reset(reset),
        .q(Q)
    );
    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        reset = 1'b1;

        #10 reset = 1'b0;
        
        #10 J = 1'b0; K = 1'b0; // Hold
        #10 J = 1'b0; K = 1'b1; // Reset
        #10 J = 1'b1; K = 1'b0; // Set
        #10 J = 1'b1; K = 1'b1; // Toggle

	#10 J = 1'b0; K = 1'b0; // Hold
        #10 J = 1'b0; K = 1'b1; // Reset
        #10 J = 1'b1; K = 1'b0; // Set
        #10 J = 1'b1; K = 1'b1; // Toggle

        $finish;
    end
endmodule