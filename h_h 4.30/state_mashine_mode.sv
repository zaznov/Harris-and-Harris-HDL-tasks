  module state_mashine_mode
(
input logic CLK,
input logic P,
input logic R,
input logic reset,
output logic M
);

typedef enum logic[0:0] {S0, S1} statetype;


statetype state, nextstate;




always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

	S0: if(P)		nextstate = S1;
		else 		nextstate = S0;

	S1: if(R)		nextstate = S0;
		else 		nextstate = S1;

	endcase


assign M = state;

endmodule 