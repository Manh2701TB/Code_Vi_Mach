module and2bit(
	input[1:0]A,
	input[1:0]B,
	output[1:0]Y
);
	assign Y=A&B;
endmodule

module or2bit(
	input[1:0]A,
	input[1:0]B,
	output[1:0]Y
);
	assign Y=A|B;
endmodule

module HalfAdder(
	input a,
	input b,
	output sum,
	output carry
);
	assign sum=a^b;
	assign carry=a&b;
endmodule

module adder(
	input[1:0]A,
	input[1:0]B,
	output[1:0]Sum,
	output Carry
);
	wire carry1,carry2;

	HalfAdder HA0(
		.a(A[0]),
		.b(B[0]),
		.sum(Sum[0]),
		.carry(carry1)
	);
	
	HalfAdder HA1(
		.a(A[1]),
		.b(B[1]),
		.sum(Sum[1]),
		.carry(carry2)
	);
	assign Carry=carry1|carry2;
endmodule

module HalfSubtractor(
	input a,
	input b,
	output diff,
	output borrow
);
	assign diff=a^b;
	assign borrow=~a&b;
endmodule 

module sub(
	input[1:0]A,
	input[1:0]B,
	output[1:0]Diff,
	output Borrow
);
	wire borrow1,borrow2;

	HalfSubtractor HS0(
		.a(A[0]),
		.b(B[0]),
		.diff(Diff[0]),
		.borrow(borrow1)
	);
	HalfSubtractor HS1(
		.a(A[1]),
		.b(B[1]),
		.diff(Diff[1]),
		.borrow(borrow2)
	);
	assign Borrow=borrow1|borrow2;
endmodule
	
module ALU_behav(
	input aluop,
	inout[4:0]funct,
	output reg[1:0]alucontrol
);	
	always @*
	begin 	
		if(~aluop)
		begin 	
			alucontrol=0;
		end
		else
		begin 	
			case(funct[4:0])
				5'b01000://+
					begin 		
						alucontrol=0;
					end
				5'b00100://-
					begin 		
						alucontrol=2'b01;
					end
				5'b00000://and
					begin 		
						alucontrol=2'b10;
					end
				5'b11000://or
					begin 		
						alucontrol=2'b11;
					end
				default:
					begin
						alucontrol=0;
					end
			endcase
		end
	end
endmodule

module ALU_2bit(
	input[1:0]a,
	input[1:0]b,
	input alu_op,
	input[4:0]functop,
	
	output reg carry_out,
	output reg borrow_out,
	output reg[1:0]result
);		
	wire[1:0]result_and;
	wire[1:0]result_or;
	wire[1:0]result_add;
	wire carry;
	wire[1:0]result_sub;
	wire borrow;
	wire [1:0]alu_control;
	and2bit and_module(
		.A(a),
		.B(b),
		.Y(result_and)
	);

	or2bit or_module(
		.A(a),
		.B(b),
		.Y(result_or)
	);
	
	adder add_module(
		.A(a),
		.B(b),
		.Sum(result_add),
		.Carry(carry)
	);
	sub sub_module(
		.A(a),
		.B(b),
		.Diff(result_sub),
		.Borrow(borrow)
	);
	
	ALU_behav alu_control_module(
		.aluop(alu_op),
		.funct(functop),
		
		.alucontrol(alu_control)
	);
	always @*	
		begin 	
			case(alu_control)
				2'b00:
				begin
					result=result_add;
					borrow_out=0;
					carry_out=carry;
				end
				2'b01:
				begin
					result=result_sub;
					borrow_out=borrow;
					carry_out=0;
				end
				2'b10:
				begin
					result=result_and;
					borrow_out=0;
					carry_out=0;
				end
				2'b11:
				begin
					result=result_or;
					borrow_out=0;
					carry_out=0;
				end
				default:
				begin
					carry_out=0;
					borrow_out=0;
					result=0;
				end
			endcase
		end
endmodule
				













