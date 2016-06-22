`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:54:33 05/27/2016
// Design Name:
// Module Name:    fp_mult
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module fp_mult(
    input [31:0] operand_a,
    input [31:0] operand_b,
    output [31:0] result
    );

wire operand_a_sign;
wire [7:0] operand_a_exponent;
wire [23:0] operand_a_mantissa;

value_decomposer decompose_a(
    .fp_value(operand_a),
    .sign(operand_a_sign),
    .exponent(operand_a_exponent),
    .complete_mantissa(operand_a_mantissa)
    );

wire operand_b_sign;
wire [7:0] operand_b_exponent;
wire [23:0] operand_b_mantissa;

value_decomposer decompose_b(
    .fp_value(operand_b),
    .sign(operand_b_sign),
    .exponent(operand_b_exponent),
    .complete_mantissa(operand_b_mantissa)
    );

wire [47:0] raw_mantissa = operand_a_mantissa * operand_b_mantissa;
wire [8:0] raw_exponent_double_bias = operand_a_exponent + operand_b_exponent;
wire [8:0] raw_exponent = raw_exponent_double_bias - 127;



wire  result_sign = (operand_a_sign == operand_b_sign) ? 0 : 1;
wire [22:0] result_mantissa = (raw_mantissa[47]) ? raw_mantissa[46:24] : raw_mantissa[45:23] ;
wire [7:0] result_exponent = (raw_mantissa[47]) ? raw_exponent[7:0] + 1 : raw_exponent;

assign result = {result_sign, result_exponent, result_mantissa};

endmodule
