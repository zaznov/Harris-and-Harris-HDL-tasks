  module state
(
input logic CLK,
input logic a,
input logic b,
input logic reset,
output logic y,
output logic i_am_in_S0,
output logic i_am_in_S1,
output logic prev_val_pos,
output logic prev_val_neg
);

typedef enum logic[0:0] {S0, S1} statetype;


statetype state, nextstate;


// State
always_ff @(posedge CLK, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;

// Next State 
always_comb 
	case (state)

	S0: if(b) 	nextstate = S1;
		else	nextstate = S0;
	S1: if(b) 	nextstate = S1;
		else	nextstate = S0;
	default: nextstate = S0;
		
	endcase
	
assign i_am_in_S0 = state == S0;
assign i_am_in_S1 = state == S1;

// Output Logic
always_ff @(posedge CLK)
	case (state)
	S0: 		y = a & prev_val_neg;
	S1: 		y = a | prev_val_neg;
	default: 	y = a & prev_val_neg;
	endcase


// Just Logic
always_ff @(posedge CLK)
begin
	prev_val_pos <= a;
end
always_ff @(negedge CLK)
begin
	prev_val_neg <= prev_val_pos;
end

	//assign y = (b) ? (a&prev_val) : (a|prev_val)
endmodule 