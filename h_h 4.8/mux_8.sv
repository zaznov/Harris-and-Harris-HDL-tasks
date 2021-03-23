 module mux_8(	input logic [2:0] sel,
				input logic [7:0] data,
				output y);
 assign y = data[sel];
 
 endmodule 