module dec_2_4( input logic [1:0] sel,
				output logic [3:0] y);
				
always_comb
	case (sel)
	0: y = 4'b0001;
	1: y = 4'b0010;
	2: y = 4'b0100;
	3: y = 4'b1000;
	endcase


endmodule 