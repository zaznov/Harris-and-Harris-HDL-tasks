  module drinks
(
input logic CLK,
input logic [2:0]value,
input logic reset,
output logic give_1_ruble_back,
output logic give_2_rubles_back,
output logic give_3_rubles_back,
output logic give_4_rubles_back,
output logic take_ur_drink
);

typedef enum logic[3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;


statetype state, nextstate;



always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

		S0: if	(value == 0)	nextstate = S0;
		else if	(value == 1)	nextstate = S1;
		else if	(value == 2)	nextstate = S2;
		else 					nextstate = S5;

		S1: if	(value == 0)	nextstate = S1;
		else if	(value == 1)	nextstate = S2;
		else if	(value == 2)	nextstate = S3;
		else 					nextstate = S6;

		S2: if	(value == 0)	nextstate = S2;
		else if	(value == 1)	nextstate = S3;
		else if	(value == 2)	nextstate = S4;
		else 					nextstate = S7;

		S3: if	(value == 0)	nextstate = S3;
		else if	(value == 1)	nextstate = S4;
		else if	(value == 2)	nextstate = S5;
		else 					nextstate = S8;

		S4: if	(value == 0)	nextstate = S4;
		else if	(value == 1)	nextstate = S5;
		else if	(value == 2)	nextstate = S6;
		else 					nextstate = S9;

		S5:						nextstate = S0;
		S6:						nextstate = S0;
		S7:						nextstate = S0;
		S8:						nextstate = S0;
		S9:						nextstate = S0;

	endcase


assign give_1_ruble_back  = (state == S6);
assign give_2_rubles_back = (state == S7);
assign give_3_rubles_back = (state == S8);
assign give_4_rubles_back = (state == S9);

assign take_ur_drink = (state == S5) | (state == S6) | (state == S7) | (state == S8) | (state == S9);



endmodule 