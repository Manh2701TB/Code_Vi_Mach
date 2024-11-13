module D_latch (
  input D,
  input clk,
  input reset,
  input enable,
  output reg Q
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      Q <= 1'b0;
    end else if (enable) begin
      Q <= D;
    end
  end

endmodule

