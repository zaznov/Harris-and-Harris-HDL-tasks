module mux_128_8(	
input logic [3:0]mux_sel,
input logic [7:0]data_0,
input logic [7:0]data_1,
input logic [7:0]data_2,
input logic [7:0]data_3,
input logic [7:0]data_4,
input logic [7:0]data_5,
input logic [7:0]data_6,
input logic [7:0]data_7,
input logic [7:0]data_8,
input logic [7:0]data_9,
input logic [7:0]data_10,
input logic [7:0]data_11,
input logic [7:0]data_12,
input logic [7:0]data_13,
input logic [7:0]data_14,
input logic [7:0]data_15,
output logic [7:0]data_out
);


always_comb
	case(mux_sel)
	0: data_out = data_0;
	1: data_out = data_1;
	2: data_out = data_2;
	3: data_out = data_3;
	4: data_out = data_4;
	5: data_out = data_5;
	6: data_out = data_6;
	7: data_out = data_7;
	8: data_out = data_8;
	9: data_out = data_9;
	10: data_out = data_10;
	11: data_out = data_11;
	12: data_out = data_12;
	13: data_out = data_13;
	14: data_out = data_14;
	15: data_out = data_15;
	default data_out = 8'bxxxx_xxxx;
	endcase

endmodule 