`timescale 1ns / 1ps

module fp_div_test;

    // Inputs
    reg [31:0] operand_a;
    reg [31:0] operand_b;

    // Outputs
    wire [31:0] result;

    // Instantiate the Unit Under Test (UUT)
    fp_div uut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result)
    );

    initial begin
        // 1.0 / 1.0 = 1.0
        operand_a = 32'h3f800000;
        operand_b = 32'h3f800000;
        #0
        if(!(result == 32'h3f800000)) $display("Test 1 failed @ %g",$realtime);
        #10;
        // 1.0 / 2.0 = 0.5 
        operand_a = 32'h3f800000;
        operand_b = 32'h40000000;
        #0
        if(!(result == 32'h3f000000)) $display("Test 2 failed @ %g",$realtime);
        #10;
        // 1.0 / 0.5 = 2 
        operand_a = 32'h3f800000;
        operand_b = 32'h3f000000;
        #0
        if(!(result == 32'h40000000)) $display("Test 3 failed @ %g",$realtime);
        #10;
        // -1.0 / 0.5 = -2 
        operand_a = 32'hbf800000;
        operand_b = 32'h3f000000;
        #0
        if(!(result == 32'hc0000000)) $display("Test 4 failed @ %g",$realtime);
        #10;
    end

endmodule

