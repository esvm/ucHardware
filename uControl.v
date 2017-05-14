module uCtrl(
		//inputs
		input clk,
		input reset,
		input eqf,
		input gtf,
		input ov,
		input [5..0] funct,
		input [5..0] opCode,
		//outputs
		output reg MemCtrl,
		output reg PCCtrl,
		output reg MDCtrl,
		output reg SECtrl,
		output reg ShiftSrc,
		output reg ShiftAmt,
		output reg IRWrite,
		output reg RegWrite,
		output reg AluOutCtrl,
		output reg EPCCtrl,
		output reg HILOWrite,
		output reg[1..0] IorD,
		output reg[1..0] ALUSrcA,
		output reg[1..0] ALUSrcB,
		output reg[1..0] RegDst,
		output reg[1..0] LSCtrl,
		output reg[1..0] SSCtrl,
		output reg[1..0] ExcptCtrl,
		output reg[2..0] ShiftCtrl,
		output reg[2..0] PCSrc,
		output reg[2..0] ALUCtrl,
		output reg[3..0] DataSrc
);

initial begin
	MemCtrl = 0;
	PCCtrl = 0;
	MDCtrl = 0;
	SECtrl = 0;
	ShiftSrc = 0;
	ShiftAmt = 0;
	IRWrite = 0;
	RegWrite = 0;
	AluOutCtrl = 0;
	EPCCtrl = 0;
	HILOWrite = 0;
	IorD = 2'b00;
	AluSrcA = 2'b00;
	AluSrcB = 2'b00;
	RegDst = 2'b00;
	LSCtrl = 2'b00;
	SSCtrl = 2'b00;
	ExcptCtrl = 2'b00;
	ShiftCtrl = 3'b000;
	PCSrc = 3'b000;
	ALUCtrl = 3'b000;
	DataSrc = 4'b0000;
end

//Defines
//United states
parameter stateSHIFT	= 1'b0;
//Valores para AluCtrl
parameter ulaSA 	= 3'b000;
parameter ulaADD 	= 3'b001;
parameter ulaSUB 	= 3'b010;
parameter ulaAND 	= 3'b011;
//Valores para as operaçoes
//FORMATO R
parameter ADD 		= 	{ 1'b0, 6'b100000 }
parameter AND 		= 	{ 1'b0, 6'b100100 }
parameter DIV 		= 	{ 1'b0, 6'b011010 }
parameter MULT		= 	{ 1'b0, 6'b011000 }
parameter JR 		= 	{ 1'b0, 6'b001000 }
parameter MFHI 	= 	{ 1'b0, 6'b010000 }
parameter MFLO 	= 	{ 1'b0, 6'b010010 }
parameter SLL		=	{ 1'b0, 6'b000000 }
parameter SLLV		=	{ 1'b0, 6'b000100 }
parameter SLT		=	{ 1'b0, 6'b101010 }
parameter SRA		=	{ 1'b0, 6'b000011 }
parameter SRAV		=	{ 1'b0, 6'b000111 }
parameter SRL 		=	{ 1'b0, 6'b000010 }
parameter SUB 		= 	{ 1'b0, 6'b100010 }
parameter BREAK 	=	{ 1'b0, 6'b001101 }
parameter RTE		=	{ 1'b0, 6'b010011 }
//FORMATO I
parameter ADDI 	= 	{ 1'b1, 6'b001000 }
parameter ADDIU 	= 	{ 1'b1, 6'b001001 }
parameter BEQ 		= 	{ 1'b1, 6'b000100 }
parameter BNE		= 	{ 1'b1, 6'b000101 }
parameter BLE 		= 	{ 1'b1, 6'b000110 }
parameter BGT	 	= 	{ 1'b1, 6'b000111	}
parameter BEQM 	= 	{ 1'b1, 6'b000001 }
parameter LB		=	{ 1'b1, 6'b100000 }
parameter LH		=	{ 1'b1, 6'b100001 }
parameter LUI		=	{ 1'b1, 6'b001111 }
parameter LW		=	{ 1'b1, 6'b100011	}
parameter SB		=	{ 1'b1, 6'b101000 }
parameter SH 		=	{ 1'b1, 6'b101001 }
parameter SLTI		= 	{ 1'b1, 6'b001010	}
parameter SW	 	=	{ 1'b1, 6'b101011 }
//FORMATO J
parameter J			=	{ 1'b1, 6'b000010	}
parameter JAL		=	{ 1'b1, 6'b000011	}

//Variables
reg[5..0] op;
reg op404;
reg start;
reg counter = 0;
reg mdrFlag = 0;

always @ (posedge clk or negedge reset) begin
	if(reset) begin
		
	
	
	end
	else begin
		op = !opCode ? {1'b0, funct} : {1'b1, opCode};
		case (currentState)
			stateSTART:
			begin
			end
			stateSHIFT:
			begin
				case (op)
					SLL, SLLV:
					begin
						ShiftCtrl = 3'b010;
					end
					SRA, SRAV:
					begin
						ShiftCtrl = 3'b100;
					end
					SRL:
					begin
						ShiftCtrl = 3'b011;
					end
				endcase
				currentState = stateSSAVE;
			end
			stateSSAVE:
			begin
				DataSrc = 1000;
				RegDst = 01;
				RegWrite = 1;
				currentState = stateWAIT;
			end
			stateRESULT:
			begin
				ALUOutCtrl = 1;
				case (op)
					ADD, SUB, AND:
					begin
						currentState = stateRSAVE;
					end
					ADDI, ADDIU:
					begin
						currentState = stateISAVE;
					end
					JAL:
					begin
						currentState = stateJAL;
					end
					LB, LH, LW, SB, SH, SW:
					begin
						currentState = stateMEM;
					end
				endcase
			end
			stateRSAVE:
			begin
				DataSrc = 0000;
				RegDst = 01;
				RegWrite = 1;
				currentState = stateWAIT;
			end
			stateISAVE:
			begin
				DataSrc = 0000;
				RegDst = 00;
				RegWrite = 1;
				currentState = stateWAIT;
			end
			stateJR, stateBREAK:
			begin
				PCSrc = 000;
				PCCtrl = 1;
				currentState = stateWAIT;
			end
			stateSLT:
			begin
				DataSrc = 0100;
				RegDst = 01;
				RegWrite = 1;
				currentState = stateWAIT;
			end
			stateJAL:
			begin
				DataSrc = 0000;
				RegWrite = 1;
				RegDst = 11;
				PCSrc = 010;
				PCWrite = 1;
				currentState = stateWAIT;
			end
			stateWAIT:
			begin
				currentState = stateSTART;
			end
			stateLS:
			begin
				case (op)
					LB:
					begin
						LSCtrl = 00;
						RegDst = 00;
						DataSrc = 0001;
						RegWrite = 1;
					end
					LH:
					begin
						LSCtrl = 01;
						RegDst = 00;
						DataSrc = 0001;
						RegWrite = 1;
					end
					LW:	
					begin
						LSCtrl = 10;
						RegDst = 00;
						DataSrc = 0001;
						RegWrite = 1;
					end
					SB:
					begin
						SSCtrl = 00;
						MemCtrl =  1;
						IorD = 10;
					end
					SH:
					begin
						SSCtrl = 01;
						MemCtrl =  1;
						IorD = 10;
					end
					SW:
					begin
						SSCtrl = 10
						MemCtrl =  1
						IorD = 10
					end
				endcase
				currentState = stateWAIT;
			end
			stateMEMWAIT:
			begin
				case (op)
					LB, LH, LW, SB, SH, SW:
					begin
						currentState = stateLS;
					end
					BEQM:
					begin
						currentState = stateBEQM2;
					end
					DIV, MULT:
					begin
						start = 0;
						if(counter < 40)
							counter = counter + 1;
						else 
							currentState = stateHILO;
					end
				endcase
			end
			stateHILO:
			begin
				HILOWrite = 1;
				currentState = stateWAIT;
			end
			stateMEM:
			begin
				IorD = 10;
				MemCtrl = 0; 
				currentState = stateMEMWAIT;
			end
			stateBEQM:
			begin
				ALUOutCtrl = 0
				IorD = 01
				MemCtrl = 0
				currentState = stateMEMWAIT;
			end
			stateBEQM2:
			begin
				LSCtrl = 10;
				
				ALUSrcA = 10;
				ALUSrcB = 00;
				ALUCtrl = 111;
				if (eqf == 1b'1)
						currentState = stateBRANCH;
				else
						currentState = stateWAIT;
			end
			stateBRANCH:
			begin
				PCSrc = 01
				PCWrite = 1
				currentState = stateWAIT;
			end
			stateEXCEP:
			begin
				ALUSrcA = 00;
				ALUSrcB = 01;
				ALUCtrl = 010;
				case (op)
					SUB:
					begin
						currentState = stateOF;
					end
					DIV:
					begin
						currentState = stateDIV0;
					end
					default:
					begin
						currentState = stateOPCODE;
					end
				endcase
			end
			stateOF:
			begin
				EPCCtrl = 1;
				ExcpCtrl = 01;
				MemCtrl = 0; 
				IorD = 11;
				currentState = stateEXCP;
			end
			stateDIV0:
			begin
				EPCCtrl = 1;
				ExcpCtrl = 10;
				MemCtrl = 0;
				IorD = 11;
				currentState = stateEXCP;
			end
			stateOPCODE:
			begin
				EPCCtrl = 1;
				ExcpCtrl = 00;
				MemCtrl = 0;
				IorD = 11;
				currentState = stateEXCP;
			end
			stateEXCP:
			begin
				if(!mdrFlag) begin
					mdrFlag = 1;
					currentState = stateEXCP;
				end	
				else begin
					currentState = stateEXCP2;
					mdrFlag = 0;
				end
			end
			stateEXCP2:
			begin
				LSCtrl = 00;
				ALUSrcA = 10;
				ALUCtrl = 000;
				currentState = stateEXCP3;
			end
			stateEXCP3:
			begin
				PCSrc = 000;
				PCWrite = 1;
				currentState = stateWAIT;
			end
			
			
			
			
			//todas as instruções
			stateOP:
			begin
				case (op)
					ADD:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUCtrl = ulaADD;
						currentState = ov ? stateEXCEP : stateRESULT;
					end
					AND:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUCtrl = ulaAND;
						currentState = stateRESULT;
					end
					DIV:
					begin
						MDCtrl = 1;
						start = 1;
						currentState = stateMEMWAIT;
					end
					MULT:
					begin
						MDCtrl = 0;
						start = 1;
						currentState = stateMEMWAIT;
					end
					JR:
					begin
						ALUSrcA = 01;
						ALUCtrl = ulaSA;
						currentState = stateJR;
					end
					MFHI:
					begin
						DataSrc = 0010;
						RegDst = 01;
						RegWrite = 1;
						currentState = stateWAIT;
					end
					MFLO:
					begin
						DataSrc = 0011;
						RegDst = 01;
						RegWrite = 1;
						currentState = stateWAIT;
					end
					SLL, SRA, SRL:
					begin
						ShiftSrc = 0;
						ShiftAmt = 0;
						ShiftCtrl = 001;
						currentState = stateSHIFT;
					end
					SLLV, SRAV:
					begin
						ShiftSrc = 1
						ShiftAmt = 1
						ShiftCtrl = 001
						currentState = stateSHIFT;
					end
					SLT:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUCtrl = 111;
						currentState = stateSLT;
					end
					SUB:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUCtrl = ulaSUB;
						currentState = ov ? stateEXCEP : stateRESULT;
					end
					BREAK:
					begin
						ALUSrcA = 00;
						ALUSrcB = 01;
						ALUCtrl = 010;
						currentState = stateBREAK;
					end
					RTE:
					begin
						PCSrc = 100
						PCCtrl = 1
						currentState = stateWAIT;
					end
					ADDI:
					begin
						ALUSrcA = 01
						ALUSrcB = 10
						SECtrl =1 
						ALUCtrl = 001
						currentState = ov ? stateEXCEP : stateRESULT;
					end
					ADDIU:
					begin
						ALUSrcA = 01
						ALUSrcB = 10
						SECtrl = 0
						ALUCtrl = 001
						currentState = stateRESULT;
					end
					BEQ, BNE, BLE, BGT:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUCtrl = 111;
						if (
								(op == BEQ && eqf == 1b'1) || (op == BNE && eqf == 1b'0) ||
								(op == BGT && gtf == 1b'1) || (op == BLE && (eqf == 1b'1 || gtf == 1b'0))
							) currentState = stateBRANCH;
						else
							currentState = stateWAIT;
					end
					BEQM:
					begin
						ALUSrcA = 01;
						ALUOutCtrl = 0;
						ALUCtrl = 000;
						currentState = stateBEQM;
					end
					LB, LH, LW, SB, SH, SW:
					begin
						ALUSrcA = 01;
						ALUSrcB = 10;
						SECtrl = 0;
						ALUCtrl = 001;
						currentState = stateRESULT;
					end
					LUI:
					begin
						DataSrc = 0110;
						RegDst = 00;
						RegWrite = 1;
						currentState = stateWAIT;
					end
					SLTI:
					begin
						SECtrl = 1;
						ALUSrcB = 10;
						ALUSrcA=01;
						ALUCtrl = 111;
						currentState = stateSLT;
					end
					J:
					begin
						PCSrc = 010;
						PCWrite = 1;
						currentState = stateWAIT;
					end
					JAL:
					begin
						AluSrcA = 00;
						ALUCtrl = 000;
						currentState = stateRESULT;
					end
				endcase
			end
		endcase		
	end
end

endmodule
