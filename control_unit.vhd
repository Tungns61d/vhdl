----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2017 10:13:54 AM
-- Design Name: 
-- Module Name: control_unit - control_unit
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.MICROPROCESSOR_LIB.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    port(
        reset : in STD_LOGIC; -- high activate reset signal
        -- controller_en : in STD_LOGIC; -- high activate Start: enable CPU
        clk : in STD_LOGIC; -- Clock
        ALUz, ALUeq, ALUgt : in STD_LOGIC;
        Addr_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        RFs : out STD_LOGIC_VECTOR(1 downto 0);
        RFwa : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        RFwe : out STD_LOGIC;
        OPr1a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr1e : out STD_LOGIC;
        OPr2a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr2e : out STD_LOGIC;
        ALUs : out STD_LOGIC_VECTOR(1 downto 0);

        OP2 : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);

        Mem_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        Mre : out STD_LOGIC;
        Mwe : out STD_LOGIC;
        Addr_out : out STD_LOGIC_VECTOR(MADDR_WIDTH - 1 downto 0)
    );
end control_unit;

architecture control_unit of control_unit is

signal irout,ir_op2 :std_LOGIC_vECTOR(datA_WIDTH - 1 downto 0);
signal pcout :std_LOGIC_vECTOR(datA_WIDTH - 1 downto 0);
signal pcclr,PCincr,Irld,pcld: STD_LOGIC;
signal addr_sel: STD_LOGIC_VECTOR(1 downto 0);

begin
ir_ic3:instruction_register Port map (
	clk =>clk,
	IR_in =>mem_in,
	IRld =>IRld,
	IR_out =>irout
			  );

ir_op2 <=x"00"&irout(7 downto 0);

pc_ic2:program_counter port map(
 clk => clk,
           PCclr =>pcclr,
           PCincr =>PCincr,
           PCld =>pcld,
           PC_in =>ir_op2,
           PC_out =>pcout);
			  

			  
controller_ic4:controller port map(
        reset =>reset,
        -- controller_en : in STD_LOGIC; -- high activate Start: enable CPU
        clk =>clk, -- Clock
        ALUz=>ALUz, 
		  ALUeq=>ALUeq,
		  ALUgt =>ALUgt,
        Instr_in =>irout,
        RFs =>RFs,
        RFwa => RFwa,
        RFwe=>RFwe,
        OPr1a =>OPr1a,
        OPr1e => OPr1e,

        OPr2a => OPr2a,
        OPr2e => OPr2e,

        ALUs => ALUs,
        IRld =>IRld,
        PCincr =>PCincr,
        PCclr =>PCclr,
        PCld =>PCld,
        Addr_sel =>Addr_sel,
        Mre =>Mre,
        Mwe =>Mwe--  ,
--        OP2 =>op2
    );

mux_ic1:mux3to1 port map (
	data_in0=>addr_in,
	data_in1=>ir_op2,
	data_in2=>pcout,
	sel=>Addr_sel,
	data_out=>addr_out );


OP2 <= ir_op2;
end control_unit;