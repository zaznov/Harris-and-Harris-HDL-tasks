module mux_logic(	input logic [2:0] sel_abc,
					output y_out);


mux_8(sel_abc, 8'b0011_1001, y_out);

 
endmodule 