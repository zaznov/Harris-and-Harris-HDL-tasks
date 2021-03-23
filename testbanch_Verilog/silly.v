module sillyfunction(
					input wire a,b,c, 
					output wire y);
					
assign y = 	~a & ~b & ~c |
			a & ~b & ~c |
			a & ~b & c;
endmodule 

