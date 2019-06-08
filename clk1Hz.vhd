library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk1Hz is
	Port (
		clk_in : in  STD_LOGIC;
		reset  : in  STD_LOGIC;
		enable  : in  STD_LOGIC;
		--cnt_out:out std_logic_vector (24 downto 0):=(others=>'0')
		cnt_out:out std_logic	
	);
end clk1Hz;

architecture Behavioral of clk1Hz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 6250000  := 0;
begin
frequency_divider: process (reset, clk_in) begin
	if (reset = '1' ) then
		counter <= 0;
	--cnt_out <= (others=>'0');
	elsif (rising_edge(clk_in) )then
		if(enable='1')then
			if (counter=6250000 ) then

			temporal <= not temporal;-- + "0000000000000000000000001";
			counter <= 0;
		else
			counter <= counter + 1;
		end if;
	end if;
end if;
end process;

	cnt_out <= temporal;
end Behavioral;
