module days_31(input logic [3:0]data,
				output logic y);

always_comb
	 case (data)
		 1: y = 1'b1;
		 2: y = 1'b0;
		 3: y = 1'b1;
		 4: y = 1'b0;
		 5: y = 1'b1;
		 6: y = 1'b0;
		 7: y = 1'b1;
		 8: y = 1'b1;
		 9: y = 1'b0;
		 10: y = 1'b1;
		 11: y = 1'b0;
		 12: y = 1'b1;
		 default: y = 1'b0;
	endcase


endmodule 