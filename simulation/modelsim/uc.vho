-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "05/13/2017 22:37:17"

-- 
-- Device: Altera 5M80ZT100C4 Package TQFP100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXV;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXV.MAXV_COMPONENTS.ALL;

ENTITY 	uControl IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	eqf : IN std_logic;
	gtf : IN std_logic;
	ov : IN std_logic;
	div0 : IN std_logic;
	funct : IN std_logic_vector(5 DOWNTO 0);
	opCode : IN std_logic_vector(5 DOWNTO 0);
	MemCtrl : BUFFER std_logic;
	PCCtrl : BUFFER std_logic;
	MDCtrl : BUFFER std_logic;
	SECtrl : BUFFER std_logic;
	ShiftSrc : BUFFER std_logic;
	ShiftAmt : BUFFER std_logic;
	IRWrite : BUFFER std_logic;
	RegWrite : BUFFER std_logic;
	ALUOutCtrl : BUFFER std_logic;
	EPCCtrl : BUFFER std_logic;
	HILOWrite : BUFFER std_logic;
	IorD : BUFFER std_logic_vector(1 DOWNTO 0);
	ALUSrcA : BUFFER std_logic_vector(1 DOWNTO 0);
	ALUSrcB : BUFFER std_logic_vector(1 DOWNTO 0);
	RegDst : BUFFER std_logic_vector(1 DOWNTO 0);
	LSCtrl : BUFFER std_logic_vector(1 DOWNTO 0);
	SSCtrl : BUFFER std_logic_vector(1 DOWNTO 0);
	ExcptCtrl : BUFFER std_logic_vector(1 DOWNTO 0);
	ShiftCtrl : BUFFER std_logic_vector(2 DOWNTO 0);
	PCSrc : BUFFER std_logic_vector(2 DOWNTO 0);
	ALUCtrl : BUFFER std_logic_vector(2 DOWNTO 0);
	DataSrc : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END uControl;

-- Design Ports Information
-- clk	=>  Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- eqf	=>  Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- gtf	=>  Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ov	=>  Location: PIN_56,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- div0	=>  Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- funct[0]	=>  Location: PIN_20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- funct[1]	=>  Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- funct[2]	=>  Location: PIN_66,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- funct[3]	=>  Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- funct[4]	=>  Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- funct[5]	=>  Location: PIN_35,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- opCode[0]	=>  Location: PIN_68,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- opCode[1]	=>  Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- opCode[2]	=>  Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- opCode[3]	=>  Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- opCode[4]	=>  Location: PIN_19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- opCode[5]	=>  Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- MemCtrl	=>  Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- PCCtrl	=>  Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- MDCtrl	=>  Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- SECtrl	=>  Location: PIN_74,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ShiftSrc	=>  Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ShiftAmt	=>  Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- IRWrite	=>  Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- RegWrite	=>  Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUOutCtrl	=>  Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- EPCCtrl	=>  Location: PIN_77,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HILOWrite	=>  Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- IorD[0]	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- IorD[1]	=>  Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUSrcA[0]	=>  Location: PIN_72,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUSrcA[1]	=>  Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUSrcB[0]	=>  Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUSrcB[1]	=>  Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- RegDst[0]	=>  Location: PIN_75,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- RegDst[1]	=>  Location: PIN_54,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LSCtrl[0]	=>  Location: PIN_97,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LSCtrl[1]	=>  Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- SSCtrl[0]	=>  Location: PIN_98,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- SSCtrl[1]	=>  Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ExcptCtrl[0]	=>  Location: PIN_76,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ExcptCtrl[1]	=>  Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ShiftCtrl[0]	=>  Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ShiftCtrl[1]	=>  Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ShiftCtrl[2]	=>  Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- PCSrc[0]	=>  Location: PIN_73,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- PCSrc[1]	=>  Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- PCSrc[2]	=>  Location: PIN_71,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUCtrl[0]	=>  Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUCtrl[1]	=>  Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ALUCtrl[2]	=>  Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- DataSrc[0]	=>  Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- DataSrc[1]	=>  Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- DataSrc[2]	=>  Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- DataSrc[3]	=>  Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA


ARCHITECTURE structure OF uControl IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_eqf : std_logic;
SIGNAL ww_gtf : std_logic;
SIGNAL ww_ov : std_logic;
SIGNAL ww_div0 : std_logic;
SIGNAL ww_funct : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_opCode : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_MemCtrl : std_logic;
SIGNAL ww_PCCtrl : std_logic;
SIGNAL ww_MDCtrl : std_logic;
SIGNAL ww_SECtrl : std_logic;
SIGNAL ww_ShiftSrc : std_logic;
SIGNAL ww_ShiftAmt : std_logic;
SIGNAL ww_IRWrite : std_logic;
SIGNAL ww_RegWrite : std_logic;
SIGNAL ww_ALUOutCtrl : std_logic;
SIGNAL ww_EPCCtrl : std_logic;
SIGNAL ww_HILOWrite : std_logic;
SIGNAL ww_IorD : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ALUSrcA : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ALUSrcB : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_RegDst : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_LSCtrl : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_SSCtrl : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ExcptCtrl : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ShiftCtrl : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_PCSrc : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ALUCtrl : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_DataSrc : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_eqf <= eqf;
ww_gtf <= gtf;
ww_ov <= ov;
ww_div0 <= div0;
ww_funct <= funct;
ww_opCode <= opCode;
MemCtrl <= ww_MemCtrl;
PCCtrl <= ww_PCCtrl;
MDCtrl <= ww_MDCtrl;
SECtrl <= ww_SECtrl;
ShiftSrc <= ww_ShiftSrc;
ShiftAmt <= ww_ShiftAmt;
IRWrite <= ww_IRWrite;
RegWrite <= ww_RegWrite;
ALUOutCtrl <= ww_ALUOutCtrl;
EPCCtrl <= ww_EPCCtrl;
HILOWrite <= ww_HILOWrite;
IorD <= ww_IorD;
ALUSrcA <= ww_ALUSrcA;
ALUSrcB <= ww_ALUSrcB;
RegDst <= ww_RegDst;
LSCtrl <= ww_LSCtrl;
SSCtrl <= ww_SSCtrl;
ExcptCtrl <= ww_ExcptCtrl;
ShiftCtrl <= ww_ShiftCtrl;
PCSrc <= ww_PCSrc;
ALUCtrl <= ww_ALUCtrl;
DataSrc <= ww_DataSrc;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_clk);

-- Location: PIN_39,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_reset);

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\eqf~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_eqf);

-- Location: PIN_5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\gtf~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_gtf);

-- Location: PIN_56,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ov~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_ov);

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\div0~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_div0);

-- Location: PIN_20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\funct[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_funct(0));

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\funct[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_funct(1));

-- Location: PIN_66,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\funct[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_funct(2));

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\funct[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_funct(3));

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\funct[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_funct(4));

-- Location: PIN_35,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\funct[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_funct(5));

-- Location: PIN_68,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opCode[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opCode(0));

-- Location: PIN_69,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opCode[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opCode(1));

-- Location: PIN_67,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opCode[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opCode(2));

-- Location: PIN_7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opCode[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opCode(3));

-- Location: PIN_19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opCode[4]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opCode(4));

-- Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\opCode[5]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_opCode(5));

-- Location: PIN_4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\MemCtrl~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_MemCtrl);

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\PCCtrl~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_PCCtrl);

-- Location: PIN_100,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\MDCtrl~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_MDCtrl);

-- Location: PIN_74,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\SECtrl~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_SECtrl);

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ShiftSrc~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ShiftSrc);

-- Location: PIN_99,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ShiftAmt~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ShiftAmt);

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\IRWrite~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_IRWrite);

-- Location: PIN_44,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\RegWrite~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_RegWrite);

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUOutCtrl~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUOutCtrl);

-- Location: PIN_77,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\EPCCtrl~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_EPCCtrl);

-- Location: PIN_6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\HILOWrite~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_HILOWrite);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\IorD[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_IorD(0));

-- Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\IorD[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_IorD(1));

-- Location: PIN_72,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUSrcA[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUSrcA(0));

-- Location: PIN_40,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUSrcA[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUSrcA(1));

-- Location: PIN_43,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUSrcB[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUSrcB(0));

-- Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUSrcB[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUSrcB(1));

-- Location: PIN_75,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\RegDst[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_RegDst(0));

-- Location: PIN_54,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\RegDst[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_RegDst(1));

-- Location: PIN_97,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\LSCtrl[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_LSCtrl(0));

-- Location: PIN_21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\LSCtrl[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_LSCtrl(1));

-- Location: PIN_98,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\SSCtrl[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_SSCtrl(0));

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\SSCtrl[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_SSCtrl(1));

-- Location: PIN_76,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ExcptCtrl[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ExcptCtrl(0));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ExcptCtrl[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ExcptCtrl(1));

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ShiftCtrl[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ShiftCtrl(0));

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ShiftCtrl[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ShiftCtrl(1));

-- Location: PIN_49,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ShiftCtrl[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ShiftCtrl(2));

-- Location: PIN_73,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\PCSrc[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_PCSrc(0));

-- Location: PIN_41,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\PCSrc[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_PCSrc(1));

-- Location: PIN_71,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\PCSrc[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_PCSrc(2));

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUCtrl[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUCtrl(0));

-- Location: PIN_84,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUCtrl[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUCtrl(1));

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\ALUCtrl[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_ALUCtrl(2));

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\DataSrc[0]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_DataSrc(0));

-- Location: PIN_8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\DataSrc[1]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_DataSrc(1));

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\DataSrc[2]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_DataSrc(2));

-- Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\DataSrc[3]~I\ : maxv_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => GND,
	oe => VCC,
	padio => ww_DataSrc(3));
END structure;


