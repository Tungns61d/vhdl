----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2017 12:22:07 AM
-- Design Name: 
-- Module Name: register_file - register_file
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

entity register_file is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           RFin : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           RFwa : in STD_LOGIC_VECTOR (ADDR_WIDTH - 1 downto 0);
           RFwe : in STD_LOGIC;
           OPr1a : in STD_LOGIC_VECTOR (ADDR_WIDTH - 1 downto 0);
           OPr1e : in STD_LOGIC;
           OPr2a : in STD_LOGIC_VECTOR (ADDR_WIDTH - 1 downto 0);
           OPr2e : in STD_LOGIC;
           OPr1 : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           OPr2 : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
end register_file;

architecture register_file of register_file is
type RF_array is array (integer range <>) of std_LOGIC_VECTOR(DatA_WIDTH - 1 downto 0);
signal RF:rf_array (0 to 15);

begin
 process (clk,reset)
 begin
if reset = '1' then
	--RF<=Others=> (Others =>	'0'); chua chac
	rf<=(others => (others=>'0')); --mo ta phan ghi du lieu vao rf

	OPR1<=(Others =>'0');
	OPR2<=(others =>'0');
	
elsif (clk ='1' and clk'event) then
		if RFwe ='1' then
			RF(conv_integer(RFWa)) <=RFin;
		end if;
		
		if OPR1e='1' then
			opr1<=RF(conv_integer(OPR1a));
		end if;
		
		if OPR2e='1' then
			opr2<=RF(conv_integer(OPR2a));
		end if;
end if;

 end process;
end register_file;