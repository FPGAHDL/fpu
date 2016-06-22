`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   17:13:18 06/22/2016
// Design Name:   fp_mult
// Module Name:   /home/manuel/Documents/myCode/hdl/verilog/fpu/ise_project/fp_mult_test.v
// Project Name:  fpu
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: fp_mult
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module fp_mult_test;

    // Inputs
    reg [31:0] operand_a;
    reg [31:0] operand_b;

    // Outputs
    wire [31:0] result;

    // Instantiate the Unit Under Test (UUT)
    fp_mult uut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result)
    );

    initial begin
        // 1.0 * 1.0 = 1.0
        operand_a = 32'h3f800000;
        operand_b = 32'h3f800000;
        #0
        if(!(result == 32'h3f800000)) $display("Test 1 failed @ %g",$realtime);
        #10;
        // 1.0 * 2.0 = 2.0
        operand_a = 32'h3f800000;
        operand_b = 32'h40000000;
        #0
        if(!(result == 32'h40000000)) $display("Test 2 failed @ %g",$realtime);
        #10;
        // 1.999999 * 1.0 = 1.999999
        operand_a = 32'h3f800000;
        operand_b = 32'h3fffffff;
        #0
        if(!(result == 32'h3fffffff)) $display("Test 3 failed @ %g",$realtime);
        #10;
        // 1.5 * 1.5 = 2.25
        operand_a = 32'h3fc00000;
        operand_b = 32'h3fc00000;
        #0
        if(!(result == 32'h40100000)) $display("Test 4 failed @ %g",$realtime);
        #10;
    end

endmodule

