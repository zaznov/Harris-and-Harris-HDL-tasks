 module SR_latch(	input logic R,
					input logic S,
					output logic Q);

always_latch
	if(R) 			Q <= 0;
	else if (S) 	Q <= 1;
	
 
 endmodule 
