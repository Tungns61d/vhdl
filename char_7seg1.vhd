LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY char_7seg1 IS
PORT ( C: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(6 downto 0));
END char_7seg1;

ARCHITECTURE Behavior OF char_7seg1 IS
begin
	--	display<="1001000"when C="0101" else  --H 0light 1 dark 0001001
--"0110000"when C="0110" else  --E
--"1110001"when C="0111"  else --L
--"1110001"when C="0000"  else --L
--"0000001" when C="0001" else "1111111"; --0


display<="0000001"when C="0000" else  --0
	"1001111"when C="0001" else  --1
	"0010010"when C="0010"  else --2
	"0000110"when C="0011"  else --3
	"1001100" when C="0100" else  --4

	"0100100"when C="0101" else  --5
	"0100000"when C="0110" else  --6
	"0001111"when C="0111"  else --7
	"0000000"when C="1000"  else --8
	"0000100" when C="1001" else  --9

	"0001000"when C="1010" else  --a
	"1100000"when C="1011" else  --b
	"0110001"when C="1100"  else --c
	"1000010"when C="1101"  else --d
	"0110000" when C="1110" else  --e
	"0111000";--f


END Behavior;