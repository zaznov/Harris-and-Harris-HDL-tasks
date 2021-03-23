   module and_another_state_mashine
(
input logic CLK,
input logic a,
input logic b,
input logic reset,
output logic q
);

typedef enum logic[1:0] {S0, S1, S2} statetype;


statetype state, nextstate;




always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

	S0: if(a)		nextstate = S1;
		else 		nextstate = S0;

	S1: if(b)		nextstate = S2;
		else 		nextstate = S0;

	S2: 			nextstate = S0;

	endcase


assign q = (state == S2);

endmodule 