module counterto7seg (
    input [6:0] state,
    output reg [7:0] led_7_segment_1,
    output led_7_segment_1_ena,
    output reg [7:0] led_7_segment_2,
    output led_7_segment_2_ena
);
    wire [7:0] bcd;
    // Vô hi?u hóa các LED 7 ?o?n
    assign led_7_segment_1_ena = 0;
    assign led_7_segment_2_ena = 0;
    // Chuy?n ??i t? nh? phân sang BCD
    binarytobcd b2bcd (
        .binary(state),
        .bcd(bcd)
    );
    // Hi?n th? giá tr? hàng ch?c
    always @* begin
        case (bcd[7:4])
            4'd0: led_7_segment_1 = 8'h3F;
            4'd1: led_7_segment_1 = 8'h06;
            4'd2: led_7_segment_1 = 8'h5B;
            4'd3: led_7_segment_1 = 8'h4F;
            4'd4: led_7_segment_1 = 8'h66;
            4'd5: led_7_segment_1 = 8'h6D;
            4'd6: led_7_segment_1 = 8'h7D;
            4'd7: led_7_segment_1 = 8'h07;
            4'd8: led_7_segment_1 = 8'h7F;
            4'd9: led_7_segment_1 = 8'h6F;
            default: led_7_segment_1 = 8'hFF;
        endcase
    end
    // Hi?n th? giá tr? hàng ??n v?
    always @* begin
        case (bcd[3:0])
            4'd0: led_7_segment_2 = 8'h3F;
            4'd1: led_7_segment_2 = 8'h06;
            4'd2: led_7_segment_2 = 8'h5B;
            4'd3: led_7_segment_2 = 8'h4F;
            4'd4: led_7_segment_2 = 8'h66;
            4'd5: led_7_segment_2 = 8'h6D;
            4'd6: led_7_segment_2 = 8'h7D;
            4'd7: led_7_segment_2 = 8'h07;
            4'd8: led_7_segment_2 = 8'h7F;
            4'd9: led_7_segment_2 = 8'h6F;
            default: led_7_segment_2 = 8'hFF;
        endcase
    end

endmodule
