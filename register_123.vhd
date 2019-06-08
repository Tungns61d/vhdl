library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.MICROPROCESSOR_LIB.ALL;

entity register_123 is
	Port (     
		clk 		: in STD_LOGIC;
		reset		: in STD_LOGIC;
		Data_in 	: in STD_LOGIC_VECTOR(data_width - 1 downto 0);
		wen 		: in STD_LOGIC;
		ir_out	: OUT STD_lOGIC_VECTOR(data_width - 1  DOWNTO 0)
	);
end register_123;

architecture register_struct of register_123 is
type RF_array is array (integer range <>) of std_LOGIC_VECTOR(DatA_WIDTH - 1 downto 0);
signal RF:rf_array (0 to 15);
signal tmp:std_logic_vector(data_width-1 downto 0);

BEGIN
process(clk,reset)
begin
if reset='1' then
	ir_out<=x"0000";
	 
elsif (clk='1' and clk'event ) then
	if wen ='1' then
		ir_out<=data_in;
	end if;
end if;
end process;
--ir_out<=tmp;
END register_struct;


