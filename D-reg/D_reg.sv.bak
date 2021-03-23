module D_reg (	input logic [31:0]data,
				output logic [31:0] y,
				input logic clk,
				input logic reset);
  
  
	always @ (posedge reset or posedge clk)
		begin
			// Reset whenever the reset signal goes low, regardless of the clock
			if (reset)
			begin
				y <= 0;
			end
			// If not resetting, update the register output on the clock's rising edge
			else
			begin
				y <= data;
			end
		end


endmodule 