module tb;

logic [1:0][1:0][7:0] packed_3d_array;

//always_ff @(posedge clk, negedge rst_n)
// if (!rst_n) begin
//   packed_3d_array <= '0;      // assign 0 to all elements of array
// end
  initial begin
  	$display("packed_3d_array = %h", packed_3d_array);
	packed_3d_array = 0;      // assign 0 to all elements of array
	// packed_3d_array = '0;	// what is the different.
  	$display("packed_3d_array = %h", packed_3d_array);

    packed_3d_array[0][0][0]   = 1'b0;         // assign one bit
  	$display("packed_3d_array[0][0][0] = %h", packed_3d_array[0][0][0]);

    packed_3d_array[0][0]      = 8'h0a;        // assign one element
  	$display("packed_3d_array[0][0] = %h", packed_3d_array[0][0]);

	packed_3d_array[0][0][3:0] = 4'ha;         // assign part select
  	$display("packed_3d_array[0][0][3:0] = %h", packed_3d_array[0][0][3:0]);

    packed_3d_array[0]         = 16'habcd;     // assign slice
  	$display("packed_3d_array[0] = %h", packed_3d_array[0]);

    packed_3d_array            = 32'h01234567; // assign entire array as vector
  	$display("packed_3d_array = %h", packed_3d_array);
  end
endmodule

// reference
// https://www.verilogpro.com/systemverilog-arrays-synthesizable/
// A SystemVerilog packed array can be assigned at once like a multi-bit vector, or also as an individual element or slice, and more.


