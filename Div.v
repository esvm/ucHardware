module Div(
	input [31:0] A,
    input [31:0] B,
	 input clk,
	 input reset,
	 input start,
    output reg[31:0] LO,
	 output reg[31:0] HI
);

    //the size of input and output ports of the division module is generic.
    parameter WIDTH = 32;
    //input and output ports.
    //internal variables    
    reg [31:0] a1,b1;
    reg [32:0] p1;   
    reg [6:0] i;
	 
	 initial begin
		i= 7'b0;
	 
	 end

    always @ (posedge clk or posedge reset)
    begin
        //initialize the variables.
		  if(i == 7'b0000000) begin
			  a1 <= A;
			  b1 <= B;
			  p1 <= 0;
		  end
        else if(i < 32)    begin //start the for loop
            p1 <= {p1[30:0],a1[31]};
            a1[31:1] <= a1[30:0];
            p1 <= p1-b1;
            if(p1[31] == 1'b1)    begin
                a1[0] <= 0;
                p1 <= p1 + b1;   
				end
            else
                a1[0] <= 1;
					 
				i <= i + 1;
        end
		  else begin
				LO <= a1;  
				HI <= p1[31:0];
		  end
    end 

endmodule
