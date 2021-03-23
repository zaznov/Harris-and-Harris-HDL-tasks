module mux_4_logic(	input logic [2:0] sel_abc,
					output logic y);

logic y1;
logic y2;
mux_4 mux_lower(sel_abc[1:0], 4'b1001, y1);
mux_4 mux_upper(sel_abc[1:0], 4'b0011, y2);

assign y = sel_abc[2] ? y2 : y1;

endmodule 






 module mux_4(	input logic [1:0] sel,
				input logic [3:0] data,
				output y);
 assign y = data[sel];
 
 endmodule 