 module state_mashine_parade
(
input logic P,
input logic R,
input logic CLK,
input logic move_a,
input logic move_b,
input logic reset,
output logic [1:0]Light_A,
output logic [1:0]Light_B
);


logic M;

state_mashine_mode state_mashine_mode
(
CLK,
P,
R,
reset,
M
);


state_mashine_lights state_mashine_lights
(
CLK,
M,
move_a,
move_b,
reset,
Light_A[1:0],
Light_B[1:0]
);


endmodule 