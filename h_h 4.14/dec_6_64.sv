 module dec_6_64(	input logic [5:0]in, 
					output logic [63:0] out);
					
	logic [3:0]out_lower;
	logic [3:0]out_middle;
	logic [3:0]out_upper;
	
	
 dec_2_4  dec_lower	( in[1:0], out_lower[3:0]);
 dec_2_4  dec_middle( in[3:2], out_middle[3:0]);
 dec_2_4  dec_upper	( in[5:4], out_upper[3:0]);
  
  
genvar up; 
genvar mid;
genvar low;
genvar activ_pin_out;
  
generate 
	activ_pin_out = 0;
	for(up = 1; up <=8; up = up*2) begin: forloop1
		for(mid = 1; mid <=8; mid = mid*2) begin: forloop2
			for(low = 1; low <=8; low = low*2) begin: forloop3
				if(out_upper == up & out_middle == mid & out_lower == low )
				begin
					assign out = activ_pin_out;
				end
				activ_pin_out = activ_pin_out + 1;
			end
		end
	end
endgenerate





 endmodule 
 

 
