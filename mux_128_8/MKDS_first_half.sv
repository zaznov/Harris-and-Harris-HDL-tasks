module MKDS_first_half
(
	input logic	[15:0]  data_in,
	input logic	CLK,
	output logic	[15:0]  strob_out_to_reg,
	output logic	[3:0]  strob_out_to_dir

);

logic strob_RW_RD;
logic CLR;
assign strob_RW_RD = data_in[14];
assign CLR = data_in[15];


logic strob_main;


delay_3 delay_3_my
(
CLK,
strob_RW_RD,
CLR,
strob_main
);




DEC_common DEC_common_my
(
data_in[12:8],
strob_main,
strob_out_to_reg[15:0],
strob_out_to_dir[3:0]
);


endmodule  