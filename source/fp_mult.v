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

wire [31:0] normal_result;

normal_mult normal_mult_instance(
    .operand_a(operand_a),
    .operand_b(operand_b),
    .result(normal_result)
);

wire [31:0] special_result;
wire is_special;

special_mult special_mult_instance(
    .operand_a(operand_a),
    .operand_b(operand_b),
    .result(special_result),
    .is_special(is_special)
);

assign result = (is_special) ? special_result : normal_result;

endmodule
