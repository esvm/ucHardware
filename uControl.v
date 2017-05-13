module uControl(
		//inputs
		input clk,
		input reset,
		input eqf,
		input gtf,
		input [5..0] funct,
		input [5..0] opCode,
		//outputs
		output reg MemCtrl,
		output reg PCControl,
		output reg MDControl,
		output reg SEControl,
		output reg ShiftSrc,
		output reg ShiftAmt,
		output reg IRWrite,
		output reg RegWrite,
		output reg AluOutCtrl,
		output reg EPCCtrl,
		output reg[1..0] IorD,
		output reg[1..0] ALUSrcA,
		output reg[1..0] ALUSrcB,
		output reg[1..0] RegDst,
		output reg[1..0] LSCtrl,
		output reg[1..0] SSCtrl,
		output reg[1..0] ExcptCtrl,
		output reg[2..0] ShiftCtrl,
		output reg[2..0] PCSource,
		output reg[2..0] ALUControl,
		output reg[3..0] DataSrc
);

initial begin
	
	
	
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
						ShiftControl = 3'b010;
					end
					SRA, SRAV:
					begin
						ShiftControl = 3'b100;
					end
					SRL:
					begin
						ShiftControl = 3'b011;
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
				PCSource = 000;
				PCControl = 1;
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
				RegDest = 11;
				PCSource = 010;
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
						LSControl = 00;
						RegDst = 00;
						DataSrc = 0001;
						RegWrite = 1;
					end
					LH:
					begin
						LSControl = 01;
						RegDst = 00;
						DataSrc = 0001;
						RegWrite = 1;
					end
					LW:	
					begin
						LSControl = 10;
						RegDst = 00;
						DataSrc = 0001;
						RegWrite = 1;
					end
					SB:
					begin
						SSControl = 00;
						MemControl =  1;
						IorD = 10;
					end
					SH:
					begin
						SSControl = 01;
						MemControl =  1;
						IorD = 10;
					end
					SW:
					begin
						SSControl = 10
						MemControl =  1
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
				endcase
			end
			stateMEM:
			begin
				IorD = 10;
				MemControl = 0; 
				currentState = stateMEMWAIT;
			end
			stateBEQM:
			begin
				ALUOutCtrl = 0
				IorD = 01
				MemControl = 0
				currentState = stateMEMWAIT;
			end
			stateBEQM2:
			begin
				LSControl = 10;
				ALUSrcA = 10;
				ALUSrcB = 00;
				ALUControl = 111;
				if (eqf == 1b'1)
					begin
						currentState = stateBRANCH;
					end
				else
					begin
						currentState = stateWAIT;
					end
			end
			stateBRANCH:
			begin
				PCSource = 01
				PCWrite = 1
				currentState = stateWAIT;
			end
			stateOP:
			begin
				case (op)
					ADD:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUControl = ulaADD;
						currentState = result;
					end
					AND:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUControl = ulaAND;
						currentState = result;
					end
					DIV:
					begin
						MDControl = 1;
						start = 1;
					end
					MULT:
					begin
						MDControl = 0;
						start = 1;
					end
					JR:
					begin
						ALUSrcA = 01;
						ALUControl = ulaSA;
						currentState = stateJR;
					end
					MFHI:
					begin
						DataSrc = 0010;
						RegDst = 01;
						RegWrite = 1;
					end
					MFLO:
					begin
						DataSrc = 0011;
						RegDst = 01;
						RegWrite = 1;
					end
					SLL, SRA, SRL:
					begin
						ShiftSrc = 0;
						ShiftAmt = 0;
						ShiftControl = 001;
						currentState = stateSHIFT;
					end
					SLLV, SRAV:
					begin
						ShiftSrc = 1
						ShiftAmt = 1
						ShiftControl = 001
						currentState = stateSHIFT;
					end
					SLT:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUControl = 111;
						currentState = stateSLT;
					end
					SUB:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUControl = ulaSUB;
						currentState = result;
					end
					BREAK:
					begin
						ALUSrcA = 00;
						ALUSrcB = 01;
						ALUControl = 010;
						currentState = stateBREAK;
					end
					RTE:
					begin
						PCSource = 100
						PCControl = 1
					end
					ADDI:
					begin
						ALUSrcA = 01
						ALUSrcB = 10
						SEControl =1 
						ALUControl = 001
						currentState = stateRESULT;
					end
					ADDIU:
					begin
						ALUSrcA = 01
						ALUSrcB = 10
						SEControl = 0
						ALUControl = 001
						currentState = stateRESULT;
					end
					BEQ, BNE, BLE, BGT:
					begin
						ALUSrcA = 01;
						ALUSrcB = 00;
						ALUControl = 111;
						if ((op == BEQ && eqf == 1b'1) ||
							 (op == BNE && eqf == 1b'0) ||
							 (op == BGT && gtf == 1b'1) ||
							 (op == BLE && (eqf == 1b'1 || gtf == 1b'0)))
						begin
							currentState = stateBRANCH;
						end
						else
						begin
							currentState = stateWAIT;
						end
					end
					BEQM:
					begin
						ALUSrc =01;
						ALUOutCtrl = 0;
						ALUControl = 000;
						currentState = stateBEQM;
					end
					LB, LH, LW, SB, SH, SW:
					begin
						ALUSrcA = 01;
						ALUSrcB = 10;
						SEControl = 0;
						ALUControl = 001;
						currentState = stateRESULT;
					end
					LUI:
					begin
						DataSrc = 0110;
						RegDst = 00;
						RegWrite = 1;
					end
					SLTI:
					begin
						SEControl = 1;
						ALUSrcB = 10;
						ALUSrcA=01;
						ALUControl = 111;
						currentState = stateSLT;
					end
					J:
					begin
						PCSource = 010;
						PCWrite = 1;
					end
					JAL:
					begin
						AluSrcA = 00;
						ALUControl = 000;
						currentState = stateRESULT;
					end
				endcase
			end
		endcase		
	end
end

endmodule
