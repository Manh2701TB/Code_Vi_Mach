`timescale 1us/1ns

module full_counter_tb();
    reg clk;
    reg reset_n;
    reg start;
    reg ud;
    wire [7:0] led_7_segment_1;
    wire led_7_segment_1_ena;
    wire [7:0] led_7_segment_2;
    wire led_7_segment_2_ena;

    // Instantiate the full_counter module
    full_counter uut (
        .clk(clk),
        .reset_n(reset_n),
        .start(start),
        .ud(ud),
        .led_7_segment_1(led_7_segment_1),
        .led_7_segment_1_ena(led_7_segment_1_ena),
        .led_7_segment_2(led_7_segment_2),
        .led_7_segment_2_ena(led_7_segment_2_ena)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Clock period of 10us (100kHz)
    end

    // Testbench logic
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;
        start = 0;
        ud = 0;

        // Apply reset
        $display("Applying reset...");
        #10 reset_n = 1; 
        #10 reset_n = 0; // Assert reset
        #10 reset_n = 1; // Deassert reset
        $display("Reset complete");

        // Test count-up
        $display("Testing count-up...");
        start = 1;
        ud = 1; // Set direction to count up
        #200; // Wait to observe counting behavior

        // Test count-down
        $display("Testing count-down...");
        ud = 0; // Set direction to count down
        #200; // Wait to observe counting behavior

        // Stop counting
        $display("Stopping counter...");
        start = 0;
        #50;

        // End simulation
        $display("Ending simulation.");
        $finish;
    end

    // Monitor outputs for debugging
    initial begin
        $monitor("Time: %0t | clk=%b | reset_n=%b | start=%b | ud=%b | led_7_segment_1=%h | led_7_segment_2=%h", 
                 $time, clk, reset_n, start, ud, led_7_segment_1, led_7_segment_2);
    end
endmodule

