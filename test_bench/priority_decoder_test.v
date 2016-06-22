`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:40:01 05/27/2016
// Design Name:   priority_coder
// Module Name:   /home/manuel/Documents/myCode/hdl/verilog/priority_coder/priority_decoder_test.v
// Project Name:  priority_coder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: priority_coder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module priority_decoder_test;

	// Inputs
	reg [7:0] input_word;

	// Outputs
	wire [2:0] msb_index;

	// Instantiate the Unit Under Test (UUT)
	priority_coder uut (
		.input_word(input_word), 
		.msb_index(msb_index)
	);

	integer i;

	initial begin
		// Initialize Inputs
		input_word = 0;
		for(i = 0; i < 256; i = i + 1)begin
			input_word = i;
			#10;
		end
	end
      
endmodule

