
module tb_ALU_2bit;
    // Inputs
    reg [1:0] a;
    reg [1:0] b;
    reg alu_op;
    reg [4:0] functop;
    
    // Outputs
    wire carry_out;
    wire borrow_out;
    wire [1:0] result;
    
    // Instantiate the ALU_2bit module
    ALU_2bit uut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .functop(functop),
        .carry_out(carry_out),
        .borrow_out(borrow_out),
        .result(result)
    );
    
    // Test Procedure
    initial begin
        // Initialize inputs
        a = 2'b00; b = 2'b00; alu_op = 1'b0; functop = 5'b00000;
        
        // Display format
        $monitor("Time=%0d a=%b b=%b alu_op=%b functop=%b => result=%b carry_out=%b borrow_out=%b", 
                  $time, a, b, alu_op, functop, result, carry_out, borrow_out);

        // Test Case 1: Addition (functop = 01000)
        a = 2'b01; b = 2'b01; alu_op = 1'b1; functop = 5'b01000;
        #10;
        
        // Test Case 2: Subtraction (functop = 00100)
        a = 2'b10; b = 2'b01; alu_op = 1'b1; functop = 5'b00100;
        #10;
        
        // Test Case 3: AND (functop = 00000)
        a = 2'b11; b = 2'b10; alu_op = 1'b1; functop = 5'b00000;
        #10;
        
        // Test Case 4: OR (functop = 11000)
        a = 2'b01; b = 2'b10; alu_op = 1'b1; functop = 5'b11000;
        #10;
        
        // Test Case 5: Default operation when alu_op = 0
        a = 2'b11; b = 2'b10; alu_op = 1'b0; functop = 5'b11111;
        #10;

        // End simulation
        $finish;
    end
endmodule
