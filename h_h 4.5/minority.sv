 module minority(input logic a, b, c,
				output logic y1, 
				output logic y2 );
			
			
			
	assign y1 = ~(a|b) | ~(a|c) | ~(b|c);
	assign y2 = ~(a|b) | (~c)&(a^b);

endmodule