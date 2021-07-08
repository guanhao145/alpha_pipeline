module tb;

logic [7:0] a, b, c;
logic [7:0] d_array[0:3];
logic [7:0] e_array[3:0]; // note index of unpacked dimension is reversed
                          // personally, I prefer this form
logic [7:0] mult_array_a[3:0][3:0];
logic [7:0] mult_array_b[3:0][3:0];

always_ff @(posedge clk, negedge rst_n)
  if (!rst_n) begin
    d_array <= '{default:0};      // assign 0 to all elements of array
  end
  else begin
    d_array        <= '{8'h00, c, b, a}; // d_array[0]=8'h00, d_array[1]=c, d_array[2]=b, d_array[3]=a
    e_array        <= '{8'h00, c, b, a}; // e_array[3]=8'h00, e_array[2]=c, e_array[1]=b, d_array[0]=a
    mult_array_a   <= '{'{8'h00, 8'h01, 8'h02, 8'h03},
                        '{8'h04, 8'h05, 8'h06, 8'h07},
                        '{8'h08, 8'h09, 8'h0a, 8'h0b},
                        '{8'h0c, 8'h0d, 8'h0e, 8'h0f}}; // assign to full array
    mult_array_b[3] <= '{8'h00, 8'h01, 8'h02, 8'h03}; // assign to slice of array
  end
  $display("d_array = %p", d_array);
  $display("e_array = %p", e_array);
  $display("mult_array_a = %p", mult_array_a);
  $display("mult_array_b[3] = %p", mult_array_b[3]);
endmodule

// reference
// https://www.verilogpro.com/systemverilog-arrays-synthesizable/
// All or multiple elements of a SystemVerilog unpacked array can be assigned at once to a list of values. 
// The list can contain values for individual array elements, or a default value for the entire array.


