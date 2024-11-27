module Counter (
  input clk,          // Xung nh?p
  input reset,        // T�n hi?u ??t l?i
  input up_down,      // T�n hi?u ?i?u khi?n h??ng ??m
  output reg [3:0] count  // ??u ra c?a b? ??m 4-bit
);

  // Kh?i x? l� ch�nh c?a b? ??m
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 4'b0000;        // ??t l?i b? ??m v? 0 khi reset = 1
    end else begin
      if (up_down) begin
        count <= count + 1;    // ??m l�n khi up_down = 1
      end else begin
        count <= count - 1;    // ??m xu?ng khi up_down = 0
      end
    end
  end
endmodule
