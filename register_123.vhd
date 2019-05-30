library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_123 is
    Port (
        
		  clk : in STD_LOGIC;
reset:in STD_LOGIC;
		  wen : in STD_LOGIC;
        Data_in : in STD_LOGIC_VECTOR(15 downto 0);
        
        LEDR : OUT STD_lOGIC_VECTOR(15 DOWNTO 0)
        );
end register_123;

architecture register_struct of register_123 is
BEGIN
process(clk,reset)
begin
if reset='1' then
	LEDR<="0010001100010101";
	
	elsif (clk='1' and clk'event) then

	LEDR <= data_in;

else LEDR<="0010000100000100";
end if;
end process;
END register_struct;


