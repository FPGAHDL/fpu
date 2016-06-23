`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:54:33 05/27/2016
// Design Name:
// Module Name:    mantissa_div
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
module single_div(
    input [24:0] operand_a,
    input [23:0] operand_b,
    output [24:0] residue,
    output result
);

wire [24:0] simple_residue = (operand_a > operand_b) ? (operand_a - operand_b) : operand_a;
assign  residue = simple_residue << 1; 
assign result = (operand_a > operand_b) ? 1 : 0;

endmodule
