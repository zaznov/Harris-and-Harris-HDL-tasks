 module gray_up_down
(
input logic CLK,
input logic down,
output logic [2:0] Y
);

typedef enum logic[2:0] {S0, S1, S2, S3, S4, S5, S6, S7} statetype;


statetype state, nextstate;




always_ff @(posedge CLK)
	state <= nextstate;

	
always_comb 
begin
	if(down)
		case (state)

		S0: nextstate = S7;
		S1: nextstate = S0;
		S2: nextstate = S1;
		S3: nextstate = S2;
		S4: nextstate = S3;
		S5: nextstate = S4;
		S6: nextstate = S5;
		S7: nextstate = S6;

		endcase
	else
		
		case (state)

		S0: nextstate = S1;
		S1: nextstate = S2;
		S2: nextstate = S3;
		S3: nextstate = S4;
		S4: nextstate = S5;
		S5: nextstate = S6;
		S6: nextstate = S7;
		S7: nextstate = S0;

		endcase
end


always_ff @(negedge CLK)
	case (state)

	S0: Y = 3'b000;
	S1: Y = 3'b001;
	S2: Y = 3'b011;
	S3: Y = 3'b010;
	S4: Y = 3'b110;
	S5: Y = 3'b111;
	S6: Y = 3'b101;
	S7: Y = 3'b100;

	endcase
endmodule 