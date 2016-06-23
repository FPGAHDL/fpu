`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:54:33 05/27/2016
// Design Name:
// Module Name:    normal_div
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
module normal_div(
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

wire [24:0] raw_result_mantissa;
wire [8:0] raw_result_exponent = operand_a_exponent - operand_b_exponent + 127;

mantissa_div mantissa_divider_instance(
    .operand_dividend(operand_a_mantissa),
    .operand_divisor(operand_b_mantissa),
    .result(raw_result_mantissa)
);


reg [22:0] result_mantissa;
reg [7:0] result_exponent;

always@(*)begin
    if(raw_result_mantissa[24] == 1)begin
        result_mantissa = raw_result_mantissa[23:1];
        result_exponent = raw_result_exponent;
    end
    else begin
        result_mantissa = raw_result_mantissa[22:0];
        result_exponent = raw_result_exponent - 1;
    end
end

wire result_sign =  operand_a_sign ^ operand_b_sign;

assign result = {result_sign, result_exponent, result_mantissa};

endmodule
