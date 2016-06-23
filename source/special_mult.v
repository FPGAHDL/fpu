`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:54:33 05/27/2016
// Design Name:
// Module Name:    special_mult
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
module special_mult(
    input [31:0] operand_a,
    input [31:0] operand_b,
    output reg [31:0] result,
    output reg is_special
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

always@(*)begin
    is_special = 0;
    result = 0;
    if(operand_a[30:0] == 0 || operand_b[30:0] == 0)begin
        is_special = 1;
        result = {(operand_a[31] ^ operand_b[31]), 31'b0};
    end
end

endmodule
