  module drinks
(
input logic CLK,
input logic [2:0]value,
input logic reset,
output logic give_1_ruble_back,
output logic give_2_rubles_back,
output logic give_4_rubles_back,
output logic [3:0] summ,
output logic M
);

typedef enum logic[3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8} statetype;


statetype state, nextstate;



always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;
	
	
always_comb 
	case (state)

		S0: if	(value == 0)	nextstate = S0;
		else if	(value == 1)	nextstate = S1;
		else if	(value == 2)	nextstate = S2;
		else 					nextstate = S3;


		S1: if	(M)				nextstate = S4;
		else if	(value == 1)	nextstate = S1;
		else if	(value == 2)	nextstate = S2;
		else 					nextstate = S3;

		S2: if	(M)				nextstate = S4;
		else if	(value == 1)	nextstate = S1;
		else if	(value == 2)	nextstate = S2;
		else 					nextstate = S3;

		S3: if	(M)				nextstate = S4;
		else if	(value == 1)	nextstate = S1;
		else if	(value == 2)	nextstate = S2;
		else 					nextstate = S3;

		S4: if	(summ == 5)		nextstate = S0;
		else if	(summ == 6)		nextstate = S0;
		else if	(summ == 7)		nextstate = S0;
		else 					nextstate = S0;

	endcase

always_ff @(posedge CLK, posedge reset)
	if(reset) 				summ <= 4'd0;
	else if(state == S1)	summ <= summ +4'd1;
	else if(state == S2)	summ <= summ +4'd2;
	else if(state == S3)	summ <= summ +4'd5;
	else if(state == S4)	summ <= 4'd0;
	else 					summ <= summ;

assign give_1_ruble_back  = (state == S4)&(summ == 6) ;
assign give_2_rubles_back = (state == S4)&(summ == 7) ;
assign give_4_rubles_back = (state == S4)&(summ == 9) ;


assign M = (summ >= 5);


endmodule 