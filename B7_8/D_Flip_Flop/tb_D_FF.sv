`timescale 1ns / 1ns

module tb_D_FF;
  reg D, clk, reset;
  wire Q;

  D_FF uut (
    .D(D),
    .clk(clk),
    .reset(reset),
    .Q(Q)
  );
  always #5 clk = ~clk;

  initial begin
    clk = 1'b0;
    reset = 1'b1;
    #10;
    reset = 1'b0;

    for (int i = 0; i < 1000; i++) begin
      D = $random; 
      #10;
    end
    
    $finish;
  end
endmodule

