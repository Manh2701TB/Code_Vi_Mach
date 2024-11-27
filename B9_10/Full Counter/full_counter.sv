module full_counter (
    input clk,
    input reset_n,
    input start,
    input ud,
    output [7:0] led_7_segment_1,
    output led_7_segment_1_ena,
    output [7:0] led_7_segment_2,
    output led_7_segment_2_ena
);

    // Tín hi?u tr?ng thái t? b? ??m
    wire [6:0] state;

    // B? ??m t? 0 ??n 99
    counter_99 counter (
        .clk(clk),
        .reset_n(reset_n),
        .start(start),
        .ud(ud),
        .state(state)
    );

    // Chuy?n ??i tr?ng thái sang hi?n th? LED 7 ?o?n
    counterto7seg c27seg (
        .state(state),
        .led_7_segment_1(led_7_segment_1),
        .led_7_segment_1_ena(led_7_segment_1_ena),
        .led_7_segment_2(led_7_segment_2),
        .led_7_segment_2_ena(led_7_segment_2_ena)
    );

endmodule
