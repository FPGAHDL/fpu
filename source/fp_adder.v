`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:54:33 05/27/2016 
// Design Name: 
// Module Name:    fp_add 
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
module fp_add(
    input [31:0] operand_a,
    input [31:0] operand_b,
    output [31:0] result
    );

wire [31:0] operand_large;
wire [31:0] operand_small;

value_redirection redirection_instance(
    .operand_1(operand_a), 
    .operand_2(operand_b), 
    .operand_large(operand_large), 
    .operand_small(operand_small)
    );

wire raw_sign;
wire [7:0] raw_exponent;
wire [24:0] raw_mantissa;

shifter_adder shift_and_add_instance (
    .operand_large(operand_large), 
    .operand_small(operand_small), 
    .raw_result_sign(raw_sign), 
    .raw_result_exponent(raw_exponent), 
    .raw_result_mantissa(raw_mantissa)
    );

wire corrected_sign;
wire [7:0] corrected_exponent;
wire [22:0] corrected_mantissa;

post_correction post_correct_instance (
    .raw_sign(raw_sign), 
    .raw_exponent(raw_exponent), 
    .raw_mantissa(raw_mantissa), 
    .corrected_sign(corrected_sign), 
    .corrected_exponent(corrected_exponent), 
    .corrected_mantissa(corrected_mantissa)
    );
	 
assign result = {corrected_sign, corrected_exponent, corrected_mantissa};

endmodule
