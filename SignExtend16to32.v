module SignExtend16to32 (
	input [15:0] in,
	output [31:0] out );
	
assign out = {16'b0, in};

endmodule
