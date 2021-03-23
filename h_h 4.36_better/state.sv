  module state
(
input logic CLK,
input logic reset,
input logic [3:0]summ,
output logic M
);
/*
typedef enum logic[0:0] {S0, S1} statetype;


statetype state, nextstate;




always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

	S0: if(summ >= 5)	nextstate = S1;
		else 			nextstate = S0;
	S1: 				nextstate = S0;
	endcase
*/

assign M = 	/*(state == S0) &*/ (summ >= 5);

endmodule 