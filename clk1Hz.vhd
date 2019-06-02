library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk1Hz is
    Port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
	enable  : in  STD_LOGIC;
        cnt_out:out std_logic_vector (24 downto 0):=(others=>'0')
    );
end clk1Hz;

architecture Behavioral of clk1Hz is
--    signal temporal: STD_LOGIC;
   -- signal counter : integer range 0 to 25000000  := 0;
begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1' and enable='1') then
            --temporal <= '0';
            cnt_out <= (others=>'0');
        elsif rising_edge(clk_in) then
           if (cnt_out = "1111111111111111111111111" ) then
                cnt_out <= "0000000000000000000000000";
--            else
                cnt_out <= cnt_out + "000000000000000000000001";
            end if;
        end if;
    end process;
   
    --clk_out <= temporal;
end Behavioral;
