`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:32:37 05/27/2016 
// Design Name: 
// Module Name:    priority_coder 
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
module priority_coder(input_word, msb_index);
parameter word_size = 25;
input [word_size-1:0] input_word;
output reg [7:0] msb_index;

integer i;

always@(*)begin
	msb_index = 0;
	for(i = 0; i < word_size; i = i +1)begin
		if(input_word[i])
			msb_index = i;
	end
end

endmodule
