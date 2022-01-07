// Combinational multiplication module 

`define width 8

module comb_mult (
		 // Outputs
		 p, rdy, 
		 // Inputs
		 clk, reset, a, b
		 ) ;
    
   input 		 clk, reset;
   input [`width-1:0] 	 a, b;
    
   // *** Output declaration for 'p'
   output reg signed [2*`width-1:0] p;
   output 		 rdy;
   reg [2*`width-1:0] multiplier, multiplicand;
       
   // *** Register declarations for p, multiplier, multiplicand
   reg 			 rdy;

   always @(posedge clk or posedge reset)
     if (reset) begin
        rdy 		<= 0;
        p 		<= 0;
		multiplicand <= $signed(a);
		multiplier <= $signed(b);
     end else begin
        // *** Implement combinational multiplication using * operation and assert ready
         p <= multiplicand*multiplier;
         rdy <= 1;
     end
   
endmodule // combmult