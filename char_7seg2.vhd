LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY char_7seg2 IS
PORT ( C: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(6 downto 0));
END char_7seg2;

ARCHITECTURE Behavior OF char_7seg2 IS
begin
		display<="1001000"when C="0110" else  --H 0light 1 dark 0001001
"0110000"when C="0111" else  --E
"1110001"when C="0001"  else --L
"1110001"when C="0000"  else --L
"0000001" when C="0010" else "1111111"; --0
END Behavior;