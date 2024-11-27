module tb_Counter();
    logic clk;
    logic reset;
    logic up_down;
    logic [3:0] count;
    // Instantiate the counter
    Counter uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock with 10 ns period
    end
    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        up_down = 1;
        #10;
        // Release reset
        reset = 0;
        #10;
        // Test counting up
        up_down = 1;
        #200
        // Test counting down
        up_down = 0;
        #200
        // Reset the counter
        reset = 1;
        #10;
        reset = 0;
        #10;
        // Test counting up again
        up_down = 1;
        #50;
        $stop; // End simulation
    end
endmodule
