----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2017 12:01:03 AM
-- Design Name: 
-- Module Name: controller - controller
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

entity controller is
    port(
        reset : in STD_LOGIC; -- high activate reset signal
        -- controller_en : in STD_LOGIC; -- high activate Start: enable CPU
        clk : in STD_LOGIC; -- Clock
        ALUz, ALUeq, ALUgt : in STD_LOGIC;
        Instr_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        RFs : out STD_LOGIC_VECTOR(1 downto 0);
        RFwa : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        RFwe : out STD_LOGIC;
        OPr1a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr1e : out STD_LOGIC;
        OPr2a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr2e : out STD_LOGIC;
        ALUs : out STD_LOGIC_VECTOR(1 downto 0);
        IRld : out STD_LOGIC;
        PCincr : out STD_LOGIC;
        PCclr : out STD_LOGIC;
        PCld : out STD_LOGIC;
        Addr_sel : out STD_LOGIC_VECTOR(1 downto 0);
        Mre : out STD_LOGIC;
        Mwe : out STD_LOGIC --;
        --OP2 : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0)
    );
end controller;

architecture controller of controller is
    type state_type is (RESET_S, FETCH, FETCHa, FETCHb, DECODE, MOV1, MOV1a, MOV1b, MOV2, MOV2a, MOV2b,
                    MOV3, MOV3a, MOV3b, MOV4, MOV4a, ADD, ADDa, ADDb, SUB, SUBa, SUBb, RSB, RSBa, RSBb,
                     XOR_S, XOR_Sa, XOR_Sb, OR_S, OR_Sa, OR_Sb, AND_S, AND_Sa, AND_Sb, JZ, JZa, JZb, JEQ,JEQa, JEQb, 
                     JGT,JGTa, JGTb, JLT, JLTa, JLTb, CLR, CLRa, CLRb, PRS, PRSa, PRSb, NOP);

begin
 

end controller;