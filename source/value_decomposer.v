`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:54:19 05/27/2016 
// Design Name: 
// Module Name:    value_decomposer 
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
module value_decomposer(
    input [31:0] fp_value,
    output sign,
    output [7:0] exponent,
    output [22:0] mantissa,
    output [23:0] complete_mantissa
    );

assign sign = fp_value[31];
assign exponent = fp_value[30:23];
assign mantissa = fp_value[22:0];
assign complete_mantissa = {1'b1,mantissa};

endmodule
