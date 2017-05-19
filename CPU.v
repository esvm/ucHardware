module CPU(
		input wire clk,
		input wire reset,
		input wire MemCtrl,
		input wire PCCtrl,
		input wire MDCtrl,
		input wire SECtrl,
		input wire ShiftSrc,
		input wire ShiftAmt,
		input wire IRWrite,
		input wire RegWrite,
		input wire ALUOutCtrl,
		input wire EPCCtrl,
		input wire HILOWrite,
		input wire [1:0] IorD,
		input wire [1:0] ALUSrcA,
		input wire [1:0] ALUSrcB,
		input wire [1:0] RegDst,
		input wire [1:0] LSCtrl,
		input wire [1:0] SSCtrl,
		input wire [1:0] ExcptCtrl,
		input wire [2:0] ShiftCtrl,
		input wire [2:0] PCSrc,
		input wire [2:0] ALUCtrl,
		input wire [3:0] DataSrc,
		output wire eqf,
		output wire gtf,
		output wire ov,
		output wire div0,
		output wire [5:0] funct,
		output wire [5:0] opCode
);

//PC 
wire [31:0] wPCData;
wire [31:0] wPCOut;
Registrador PC(.Clk(clk), .Reset(reset), .Load(PCCtrl), .Entrada(wPCData), .Saida(wPCOut));

//IorD
wire [31:0] wIorD;
wire [31:0] wALUResult;
wire [31:0] wALUOut;
wire [31:0] wExcep;
mux4to1 IorDMux(wPCOut, wALUResult, wALUOut, wExcep, IorD, wIorD);

//Memoria
wire [31:0] wSSOut;
wire [31:0] wMemOut;
Memoria MEM(wIorD, clk, MemCtrl, wSSOut, wMemOut);

//Exception Mux
wire [7:0] in1;
wire [7:0] in2;
wire [7:0] in3;
assign exc1 = 253;
assign exc2 = 254;
assign exc3 = 255;
Mux3to1 ExcptCtrlMux(exc1, exc2, exc3, ExcptCtrl, wExcep);

//IR
wire [25:21] rs;
wire [20:16] rt;
wire [15:0] immediate;
Instr_Reg IR(clk, reset, IRWrite, wMemOut, opCode, rs, rt, immediate);

//RegDstMux
wire [4:0] rdst3;
wire [4:0] rdst4;
assign rdst3 = 30;
assign rdst4 = 31;
wire [4:0] wRegDstOut;
mux4to1 RegDstMux(rt, immediate[15:11], rdst3, rdst4, RegDst, wRegDstOut);

//DataSrcMux
wire [31:0] wLSOut;
wire [31:0] wHIOut;
wire [31:0] wLOOut;
wire [31:0] wSE32Out;
wire [31:0] wSE16Out;
wire [31:0] wSL16Out;
wire [31:0] wShiftRegOut;
wire [31:0] wDataSrcOut;
Mux9to1 DataSrcMux(wALUOut, wLSOut, wHIOut, wLOOut, wSE32Out, wSE16Out, wSL16Out, wExcep, wShiftRegOut, DataSrc, wDataSrcOut);

//BR
wire [31:0] wA;
wire [31:0] wB;
Banco_reg BR(clk, reset, RegWrite, rs, rt, wRegDstOut, wDataSrcOut, wA, wB);

//RegA
wire loadA;
assign loadA = 1;
wire [31:0] wAOut;
Registrador A(clk, reset, loadA, wA, wAOut);

//RegB
wire loadB;
assign loadB = 1;
wire [31:0] wBOut;
Registrador B(clk, reset, loadB, wB, wBOut);

//ALUSrcAMux
wire [31:0] wAluSrcAOut;
Mux3to1 ALUSrcAMux(wPCOut, wAOut, wLSOut, ALUSrcA, wAluSrcAOut);

//ALUSrcBMux
wire [31:0] wAluSrcBOut;
wire [31:0] wSL2Out;
wire [31:0] w4;
assign w4 = 4;
mux4to1 ALUSrcBMux(wBOut, w4, wSE16Out, wSL2Out, AluSrcB, wAluSrcBOut);

//ULA
wire neg;
wire z;
wire ltf;
ula32 ULA(wAluSrcAOut, wAluSrcBOut, ALUCtrl, wALUResult, ov, neg, z, eqf, gtf, ltf);

//ALUOut
Registrador ALUOut(clk, reset, ALUOutCtrl, wALUResult, wALUOut);

//EPC
wire [31:0] wEPCOut;
Registrador EPC(clk, reset, EPCCtrl, wALUResult, wEPCOut);

//PCSrcMux
wire [27:0] wSL26Out;
wire [31:0] wPCSrc2;
assign wPCSrc2 = {wPCOut[31:28], wSL26Out[27:0]};
Mux5to1 PCSrcMux(wALUResult, wALUOut, wPCSrc2, wLSOut, wEPCOut);

//ShiftLeft26
wire [25:0] wSL26In;
assign wSL26In = {rs, rt, immediate};
ShiftLeft26to28 SL26(wSL26In, wSL26Out);


//para o LS
wire [31:0] Data;
//para o RegDes

















endmodule
