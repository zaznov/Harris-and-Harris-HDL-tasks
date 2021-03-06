  module state_mashine_lights
(
input logic CLK,
input logic M,
input logic move_a,
input logic move_b,
input logic reset,
output logic [1:0]Light_A,
output logic [1:0]Light_B
);

typedef enum logic[1:0] {S0, S1, S2, S3} statetype;


statetype state, nextstate;




always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

	S0: if(move_a)	nextstate = S0;
		else 		nextstate = S1;

	S1: 			nextstate = S2;

	S2: if(move_b | M)	nextstate = S2;
		else 		nextstate = S3;

	S3: 			nextstate = S0;

	endcase


assign Light_A[1:0] = state;																// 0 = green, 1 = yellow, 2,3 = red
assign Light_B[1:0] = (state== S0 | state== S1) ? (3 - state) : (state== S2 ? 0 : 1) ;		// 0 = green, 1 = yellow, 2,3 = red

endmodule 