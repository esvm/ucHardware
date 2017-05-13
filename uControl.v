module uControl(
		input clk,
		input reset,
		input eqf,
		input gtf,
		input [5..0] func,
		input [5..0] op,
		output reg[2..0] ALUCtrl,
		output reg MemCtrl,
		output reg PCCtrl,
		output reg[1..0] IorD,
		output reg IRWrite,
		output reg RegWrite,
		output reg[1..0] RegDest,
		output reg[1..0] LSCtrl,
		output reg[3..0] DataSrc,
		output reg[1..0] SSCtrl,
		output reg MdCtrl,
		output reg SeCtrl,
		output reg ShiftSrc,
		output reg ShiftAmt,
		output reg[1..0] ExcptCtrl,
		output reg[2..0] ShiftCtrl,
		output reg[1..0] AluSrcA,
		output reg[1..0] AluSrcB,
		output reg AluOutCtrl,
		output reg EPCCtrl,
		output reg[2..0] PCSrc
);

initial begin


end


endmodule
