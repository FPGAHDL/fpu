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
module mantissa_div(
    input [23:0] operand_dividend,
    input [23:0] operand_divisor,
    output [24:0] result,
    output [24:0] residue
);
parameter mantissa_length = 24;

wire [mantissa_length:0] residue_wire[mantissa_length + 1:0];
wire [mantissa_length:0] result_wire;

assign residue_wire[0] = operand_dividend; 

genvar i;
generate
    for(i = 0; i <= mantissa_length; i = i+1)
    begin : gen
        single_div mydiv(
            .operand_a(residue_wire[i]),
            .operand_b(operand_divisor),
            .residue(residue_wire[i+1]),
            .result(result_wire[mantissa_length - i]));
    end
endgenerate

assign result = result_wire;
assign residue = residue_wire[mantissa_length + 1];

endmodule
