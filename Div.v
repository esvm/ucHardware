module Div (
	input clk,
	input reset,
	input [31:0] A,
	input [31:0] B,
	output reg [31:0] LO, //quotient
   output reg [31:0] HI, //modulus
	output reg div0,
	output reg [5:0] counter
);

	//variables
	reg [31:0] a;
	reg [31:0] b;
	reg [31:0] q;
	reg [31:0] r = 0;
	reg [31:0] p1 = 0;
	
	initial begin
		a <= A;
		b <= B;
		p1 <= 0;
	end
	
	always@(posedge clk or negedge reset) begin
		if(reset) begin
			a <= A;
			b <= B;
			p1 <= 0;
			counter <= 0;
		end
		else if(b == 0)
			div0 <= 1;
		else begin
			if(counter < 32) begin
				p1 <= {p1[30:0], a[31]};
				a[31:1] <= a[30:0];
				p1 <= p1 - b;
				if(p1[7] == 1) begin
					a[0] <= 0;
					p1 <= p1 + b;
				end
				else
					a[0] <= 1;
				counter <= counter + 1;
			end
			else begin
				LO <= a;
				HI <= p1;
				counter <= 0;
			end
		end
	end
endmodule 