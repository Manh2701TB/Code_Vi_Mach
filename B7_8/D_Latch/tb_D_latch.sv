`timescale 1ns / 1ns
module tb_D_latch;
  reg D;
  reg clk;
  reg reset;
  reg enable;
  wire Q;
  D_latch uut (
    .D(D), 
    .clk(clk), 
    .reset(reset), 
    .enable(enable), 
    .Q(Q)
  );
  initial begin
    D = 0;
    clk = 0;
    reset = 0;
    enable = 0;
    
    #10 reset = 1;
    #10 reset = 0;

    #10 enable = 1; D = 1;
    #20 enable = 0;
    #10 enable = 1; D = 0;
    #20 D = 1;
    #10 enable = 0;
    #10 enable = 1;
    #40 $finish;
  end
  always begin
    #5 clk = ~clk;
  end
  initial begin
    $monitor("At time %t, D = %b, clk = %b, reset = %b, enable = %b, Q = %b", $time, D, clk, reset, enable, Q);
  end
endmodule

