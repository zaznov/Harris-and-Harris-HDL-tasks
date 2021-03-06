 module Schnecke
(
input logic CLK,
input logic value,
input logic reset,
output logic q
);

typedef enum logic[2:0] {S0, S1, S2, S3, S4} statetype;


statetype state, nextstate;




always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

	S0: if(value)	nextstate = S1;
		else 		nextstate = S0;
	S1: if(value)	nextstate = S2;
		else 		nextstate = S0;
	S2: if(value)	nextstate = S4;
		else 		nextstate = S3;
	S3: 			nextstate = S0;
	S4: if(value)	nextstate = S4;
		else 		nextstate = S3;

	endcase


assign q = 	(value == 0)&(state == S4) | 
			(value == 1)&(state == S3);

endmodule 