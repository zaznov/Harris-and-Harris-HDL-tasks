   module money_back
(
input logic CLK,
input logic reset,
input logic [3:0]summ,
output logic give_1_ruble_back,
output logic give_2_rubles_back,
output logic give_4_rubles_back
);

typedef enum logic[2:0] {S0, S1, S2, S3, S4} statetype;


statetype state, nextstate;




always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

	S0: if		(summ == 5)	nextstate = S1;
		else if (summ == 6)	nextstate = S2;
		else if (summ == 7)	nextstate = S3;
		else if (summ == 9)	nextstate = S4;
		else  				nextstate = S0;
	S1: 					nextstate = S0;
	S2: 					nextstate = S0;
	S3: 					nextstate = S0;
	S4: 					nextstate = S0;
	endcase


assign give_1_ruble_back  = (state == S2);
assign give_2_rubles_back = (state == S3);
assign give_4_rubles_back = (state == S4);

endmodule 