module semisegment(	input logic [3:0] data,
					output logic [6:0] y);

always_comb
	begin
		case(data)
		//		 abc_defg
		0: 				y = 7'b111_1110;
		1: 				y = 7'b011_0000;
		2: 				y = 7'b110_1101;
		3: 				y = 7'b111_1001;
		4: 				y = 7'b011_0011;
		
		5: 				y = 7'b101_0111;
		6: 				y = 7'b101_1111;
		7: 				y = 7'b111_0000;
		8: 				y = 7'b111_1111;
		9: 				y = 7'b111_0111;
		
		4'hA: 			y = 7'b111_1111;
		4'hB: 			y = 7'b111_1111;
		4'hC: 			y = 7'b111_1111;
		4'hD: 			y = 7'b111_1111;
		4'hE: 			y = 7'b111_1111;
		4'hF: 			y = 7'b111_1111;
		default : 		y = 7'b000_0000;
		endcase
	end
endmodule 