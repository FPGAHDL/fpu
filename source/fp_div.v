`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:54:33 05/27/2016
// Design Name:
// Module Name:    fp_div
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
module fp_div(
    input [31:0] operand_a,
    input [31:0] operand_b,
    output [31:0] result
);

normal_div normal_div_instance(
    .operand_a(operand_a),
    .operand_b(operand_b),
    .result(result)
);

endmodule
