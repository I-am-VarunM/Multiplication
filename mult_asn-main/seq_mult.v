// Sequential multiplication module 

`define width 8
`define ctrwidth 4

module seq_mult (
		 // Outputs
		 p, rdy, 
		 // Inputs
		 clk, reset, a, b
		 ) ;
    
   input 		 clk, reset;
   input [`width-1:0] 	 a, b;
   // *** Output declaration for 'p'
   output 		 rdy;
   
   // *** Register declarations for p, multiplier, multiplicand
   reg 			 rdy;
   reg [`ctrwidth:0] 	 ctr;

   always @(posedge clk or posedge reset)
     if (reset) begin
        rdy 		<= 0;
        p 		<= 0;
        ctr 		<= 0;
        multiplier 	<= $signed(a)/* *** sign-extend */;
        multiplicand 	<= $signed(b)/* *** sign-extend */; 
     end else begin 
        if (ctr < 2*`width/* *** How many times should the loop run? */ ) 
        begin
           p <= p + (multiplier[ctr] ? (multiplicand << ctr) : 0); // *** Code for multiplication
           ctr <= ctr+1;
        end else begin
            rdy <= 1;    // Assert 'rdy' signal to indicate end of multiplication
        end
     end
   
endmodule // seqmult
