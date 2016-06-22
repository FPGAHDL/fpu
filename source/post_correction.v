`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:31:14 05/27/2016 
// Design Name: 
// Module Name:    post_correction 
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
module post_correction(
    input raw_sign,
    input [7:0] raw_exponent,
    input [24:0] raw_mantissa,
    output reg corrected_sign,
    output reg [7:0] corrected_exponent,
    output reg [22:0] corrected_mantissa
    );

wire [7:0] msb_index;

priority_coder decoder_instace (
    .input_word(raw_mantissa), 
    .msb_index(msb_index)
    );

always@(*)begin
	if(raw_mantissa != 0)begin
		corrected_sign = raw_sign;
		if(msb_index == 24)begin
			corrected_exponent = raw_exponent + 1 ;
			corrected_mantissa = (raw_mantissa >> 1); 
		end
		else begin
			corrected_exponent = raw_exponent  - (8'd23 - msb_index);
			corrected_mantissa = (raw_mantissa << (raw_exponent  - (8'd23 - msb_index))); 
		end
	end
	else begin
		corrected_sign = 0;
		corrected_exponent = 0;
		corrected_mantissa = 0;
	end
end


endmodule
