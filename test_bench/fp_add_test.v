`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:03:22 05/27/2016
// Design Name:   fp_add
// Module Name:   /home/manuel/Documents/myCode/hdl/verilog/priority_coder/fp_add_test.v
// Project Name:  priority_coder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fp_add
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fp_add_test;

	// Inputs
	reg [31:0] operand_a;
	reg [31:0] operand_b;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	fp_add uut (
		.operand_a(operand_a), 
		.operand_b(operand_b), 
		.result(result)
	);

	initial begin
		operand_a = 32'h3f800000;
		operand_b = 32'h3f800000;
		#0
		if(!(result == 32'h40000000)) $display("Test 1 failed @ %g",$realtime);
		#10;
		operand_a = 32'h3f800000;
		operand_b = 32'hbf800000;
		#0
		if(!(result == 32'h00000000)) $display("Test 2 failed @ %g",$realtime);
		#10;
		operand_a = 32'h3f800000;
		operand_b = 32'h3fa00000;
		#0
		if(!(result == 32'h40100000)) $display("Test 3 failed @ %g",$realtime);
		#10;
		operand_a = 32'h3f800000;
		operand_b = 32'hbfa00000;
		#0
		if(!(result == 32'hbe800000)) $display("Test 4 failed @ %g",$realtime);
		#10;
		operand_a = 32'h43164000;//150.25
		operand_b = 32'hc3160000;//-150
		#0
		if(!(result == 32'h3e800000)) $display("Test 5 failed @ %g",$realtime);//0.25
		#10;
	end
      
endmodule

