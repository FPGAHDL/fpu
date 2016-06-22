`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:21:24 05/27/2016 
// Design Name: 
// Module Name:    shifter_adder 
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
module shifter_adder(
    input [31:0] operand_large,
    input [31:0] operand_small,
    output raw_result_sign,
    output [7:0] raw_result_exponent,
    output reg [24:0] raw_result_mantissa
    );

wire operand_large_sign;
wire [7:0] operand_large_exponent;
wire [23:0] operand_large_mantissa;

wire operand_small_sign;
wire [7:0] operand_small_exponent;
wire [23:0] operand_small_mantissa;

value_decomposer decomposer_large(
    .fp_value(operand_large), 
    .sign(operand_large_sign), 
    .exponent(operand_large_exponent), 
    .complete_mantissa(operand_large_mantissa)
    );

value_decomposer decomposer_small(
    .fp_value(operand_small), 
    .sign(operand_small_sign), 
    .exponent(operand_small_exponent), 
    .complete_mantissa(operand_small_mantissa)
    );

assign raw_result_sign = operand_large_sign;
assign raw_result_exponent = operand_large_exponent;

wire [23:0] shifted_small_mantissa = operand_small_mantissa >> (operand_large_exponent - operand_small_exponent);

always@(*)begin
	if(operand_large_sign == operand_small_sign)
		raw_result_mantissa = operand_large_mantissa + shifted_small_mantissa;
	else
		raw_result_mantissa = operand_large_mantissa - shifted_small_mantissa;
end

endmodule
