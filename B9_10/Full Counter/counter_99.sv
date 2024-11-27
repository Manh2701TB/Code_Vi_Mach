module counter_99 (
    input clk,
    input reset_n,
    input start,
    input ud,
    output reg [6:0] state
);
    localparam clk_div_period = 12_000_000;
    reg [24:0] counter_clk;

    always @(posedge clk, negedge reset_n) begin
        if (~reset_n)
            counter_clk <= 0;
        else if (counter_clk == clk_div_period - 1)
            counter_clk <= 0;
        else
            counter_clk = counter_clk + 1;
    end

    always @(posedge clk, negedge reset_n) begin
        if (~reset_n) begin
            if (ud)
                state <= 0;
            else
                state <= 99;
        end else begin
            if (start && counter_clk == clk_div_period - 1) begin
                if (ud)
                    state <= state + 1;
                else
                    state <= state - 1;
            end else
                state <= state;
        end
    end
endmodule
