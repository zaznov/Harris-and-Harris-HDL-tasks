 module log_expressions( 	input logic [3:0]a,
							//input logic b,
							//input logic c,
							//input logic d,
							output logic p);
 
 
 
 assign p = (a[1]&~a[2]&~a[3]) | (a[0]&a[2]&~a[3]) | (a[0]&a[1]&~a[2]) | (a[0]&~a[1]&a[2]) ;

 
endmodule 