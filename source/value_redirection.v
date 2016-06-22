`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:51:54 05/27/2016 
// Design Name: 
// Module Name:    value_redirection 
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
module value_redirection(
    input [31:0] operand_1,
    input [31:0] operand_2,
    output reg [31:0] operand_large,
    output reg [31:0] operand_small
    );

wire operand_1_sign;
wire [7:0] operand_1_exponent;
wire [22:0] operand_1_mantissa;

wire operand_2_sign;
wire [7:0] operand_2_exponent;
wire [22:0] operand_2_mantissa;

value_decomposer decomposer_1(
    .fp_value(operand_1), 
    .sign(operand_1_sign), 
    .exponent(operand_1_exponent), 
    .mantissa(operand_1_mantissa)
    );

value_decomposer decomposer_2(
    .fp_value(operand_2), 
    .sign(operand_2_sign), 
    .exponent(operand_2_exponent), 
    .mantissa(operand_2_mantissa)
    );
	 
always@(*)begin
	operand_large = operand_1;
	operand_small = operand_2;
	if(operand_1_exponent > operand_2_exponent)begin
		operand_large = operand_1;
		operand_small = operand_2;
	end
	else if(operand_1_exponent < operand_2_exponent)begin
		operand_large = operand_2;
		operand_small = operand_1;
	end
	else begin
		if(operand_1_mantissa >= operand_2_mantissa)begin
			operand_large = operand_1;
			operand_small = operand_2;
		end
		else begin
			operand_large = operand_2;
			operand_small = operand_1;
		end
	end
end

endmodule
