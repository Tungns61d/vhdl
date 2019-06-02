-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 31.5.2019 10:40:53 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_soc is
end tb_soc;

architecture tb of tb_soc is

    component soc
        port (clock_50 : in std_logic;
              sw       : in std_logic_vector (17 downto 0);
              hex0     : out std_logic_vector (0 to 6);
              hex1     : out std_logic_vector (0 to 6);
              hex2     : out std_logic_vector (0 to 6);
              hex3     : out std_logic_vector (0 to 6);
              hex4     : out std_logic_vector (0 to 6);
              hex5     : out std_logic_vector (0 to 6);
              hex6     : out std_logic_vector (0 to 6);
              hex7     : out std_logic_vector (0 to 6);
              ledg     : out std_logic_vector (8 downto 0);
              ledr     : out std_logic_vector (17 downto 0));
    end component;

    signal clock_50 : std_logic;
    signal sw       : std_logic_vector (17 downto 0);
    signal hex0     : std_logic_vector (0 to 6);
    signal hex1     : std_logic_vector (0 to 6);
    signal hex2     : std_logic_vector (0 to 6);
    signal hex3     : std_logic_vector (0 to 6);
    signal hex4     : std_logic_vector (0 to 6);
    signal hex5     : std_logic_vector (0 to 6);
    signal hex6     : std_logic_vector (0 to 6);
    signal hex7     : std_logic_vector (0 to 6);
    signal ledg_address     : std_logic_vector (8 downto 0);
    signal ledr_sw     : std_logic_vector (17 downto 0);

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : soc
    port map (clock_50 => clock_50,
              sw       => sw,
              hex0     => hex0,
              hex1     => hex1,
              hex2     => hex2,
              hex3     => hex3,
              hex4     => hex4,
              hex5     => hex5,
              hex6     => hex6,
              hex7     => hex7,
              ledg     => ledg_address,
              ledr     => ledr_sw);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clock_50 is really your main clock signal
    clock_50 <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sw <= (others => '0');
sw <= "110101010100110101";
wait for 2500 ns;
	sw <= "010011010000110101";
wait for 2500 ns;
	sw <= "010101011100110010";
wait for 3500 ns;
	sw <= "100011010100110101";
wait for 2500 ns;
	sw <= "011001010000111010";
wait for 2500 ns;
	sw <= "001101010001011011";
wait for 3500 ns;

sw <= "010101010100110101";

        -- Reset generation
        --  EDIT: Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        sw(16) <= '1';
        wait for 5500 ns;
        sw(16) <= '0';
        wait for 3500 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_soc of tb_soc is
    for tb
    end for;
end cfg_tb_soc;
