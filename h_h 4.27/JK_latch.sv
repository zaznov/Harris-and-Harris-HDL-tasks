
 
 
   module JK_latch(	input logic J,
					input logic K,
					input logic CLK,
					output logic Q);

always @(posedge CLK)
	if(J & K) 			Q <= ~Q;
	else if (J) 		Q <= 1;
	else if (K) 		Q <= 0;
 
 endmodule 
