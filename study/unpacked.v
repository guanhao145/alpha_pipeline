module tb;
	bit [5:2][7:0]	stack [2][4];
	bit [1:0] busA, busB; 

	initial begin
		foreach (stack[i])
			foreach (stack[i][j]) begin
				stack[i][j] = $random;
				$display("stack[%0d][%0d] = 0x%0h", i, j, stack[i][j]);
			end
		busA = stack[0][0][2][5+:2];		//	equivalent to stack[0][0][2][6:5]
		busB = stack[0][0][2][5-:2];		//	equivalent to stack[0][0][2][5:4]
		// When accessing a range of indices (a slice) of a SystemVerilog array, 
		// you can specify a variable slice by using the [start+:increment width] and [start-:decrement width] notations. 
		// They are simpler than needing to calculate the exact start and end indices when selecting a variable slice. 
		// The increment/decrement width must be a constant.
		
		// print the contents
		$display("stack = %p", stack);
		$display("stack[0][0][2] = 0x%0h", stack[0][0][2]);
		$display("busA = %p", busA);
		$display("busB = %p", busB);
	end

endmodule



// reference
// https://www.chipverify.com/systemverilog/systemverilog-unpacked-arrays

/*
	bit [3:0][7:0]	stack [2][4];
stack[0][0] = 0x12153524 = 00010010 00010101 00110101 00100100
							3			2		1		0
stack[0][0][2] = 00010101 = 8'h15


	bit [0:3][7:0]	stack [2][4];
stack[0][0] = 0x12153524 = 00010010 00010101 00110101 00100100
								0		1		2		3
stack[0][0][2] = 00110101 = 8'h35


	bit [6:3][7:0]	stack [2][4];
stack[0][0] = 0x12153524 = 00010010 00010101 00110101 00100100
								5		4		3		2
stack[0][0][2] = 00100100 = 8'h24

*/

//In a multidemensional declaration, the dimensions declared before the name vary more faster than the dimensions following the name. 
/*
	bit [1:4]			my_var	[1:5]			// 1:4 varies faster than 1:5
	bit 				my_var2	[1:5][1:3]		// 1:3 varies faster than 1:5
	bit	[1:3][1:7]		my_var3;				// 1:7 varies faster than 1:3
	bit [1:3][1:2]		my_var4 [1:7][0:2]		// 1:2 varies most rapidly, followed by 1:3, then 0:2 and then 1:7
*/



