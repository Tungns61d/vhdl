----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2017 03:50:57 PM
-- Design Name: 
-- Module Name: ALU - ALU
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.MICROPROCESSOR_LIB.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( OPr1 : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           OPr2 : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           ALUs : in STD_LOGIC_VECTOR (1 downto 0);
           ALUr : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           ALUz : out STD_LOGIC;
           ALUeq: out STD_LOGIC;
           ALUgt : out STD_LOGIC
        );
end ALU;

architecture ALU of ALU is
signal result : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
begin
process(ALUs,OPR1,OPR2)
BEgin
CAse ALUs IS
When "00" => result <= OPR1+OPR2;
When "01" => result <= OPR1-OPR2;
When "10" => result <= OPR1 OR OPR2;
When "11" => result <= OPR1 AND OPR2;
When others => result <=( others => '0');
end case;
end process;

ALUr <= result;
aluz <='1' when (OPR1 =0) else '0';
end ALU;