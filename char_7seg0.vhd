LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY char_7seg0 IS
PORT ( C: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(6 downto 0));
END char_7seg0;

ARCHITECTURE Behavior OF char_7seg0 IS
begin
	display<="1001000"when C="0100" else  --H 0light 1 dark 0001001
"0110000"when C="0101" else  --E
"1110001"when C="0110"  else --L
"1110001"when C="0111"  else --L
"0000001" when C="0000" else "1111111"; --0
END Behavior;