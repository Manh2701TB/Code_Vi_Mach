module binarytobcd (
 input [6:0] binary,
 output reg [7:0] bcd
);
 reg [4:0] i;
 always @*
 begin
 bcd = 8'b0;
 for (i = 0 ; i < 7 ; i = i + 1)
 	begin
 	if (bcd[7:4] >= 5)
 		bcd[7:4] = bcd[7:4] + 3;
 	if (bcd[3:0] >= 5)
 		bcd[3:0] = bcd[3:0] + 3;
 	bcd = {bcd[7:0],binary[6-i]};
 	end
 end
endmodule
