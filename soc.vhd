library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use WORK.MICROPROCESSOR_LIB.ALL;

use std.textio.all;

entity soc is
port(
--writing
clock_50:in std_logic;
sw 	:in std_logic_vector(17 downto 0);--13
--writing port
hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7:out std_logic_vector(0 to 6);

ledg:out std_logic_vector ( 8 DOWnto 0);

ledr:out std_logic_vector (17 downto 0));
end soc;--20



architecture behaviour of soc is--24
constant fdiv:integer:=24;
component ramp
port
(
	address:in std_logic_vector(7 downto 0);
	clock:in std_logic;
	data:in std_logic_vector(15 downto 0);
	wren:in std_logic;
	q:out std_logic_vector(15 downto 0)
);	--34
end component;




signal clk,wen,reset:std_logic;


signal addr :std_logic_vector(data_width-1 downto 0);--43


signal datain:std_logic_vector(data_width-1 downto 0);
signal dataout:std_logic_vector(data_width-1 downto 0);--47
signal cnt_out:std_logic_vector (fdiv-1 downto 0);
signal ir_out:std_logic_vector (data_width-1 downto 0);

signal Rwen,Mwen:std_logic;--51

begin

MWen<=wen and (not(addr(12)or addr(13) or addr(14) or addr(15)));
Rwen<=wen and (not((not addr(12)) or addr(13) or addr(14) or addr(15)));
ledg(8)<=rwen;
--clock generate
clk<=cnt_out(22);
clk_gen: clk1Hz generic map (data_width=>24) port map (clock_50,reset,sw(16),cnt_out);
--reset generate
reset <=sw(17);--62
--uut component
dut_pro:cpu 
port map (
	reset=>reset,
	clk=>clk,--67
	data_in=>datain,
	addr_out=>addr,
	data_out=>dataout,
	mre=>Rwen,
	mwe=>Mwen
	);
		
memory:ramp --75


port map (

clock=>clk,
address=>addr(7 downto 0),
data=>dataout,--82
	
wren		=> rwen,
		q		=>dataout
	
);

maybeRegister:register_123 
--maybe_register_cuoi
generic map (data_width=>16)--91
port map (clk,reset,dataout,rwen,ir_out);
------------------
ic2:char_7seg0 port map (ir_out(3 downto 0),hex0);
ic3:char_7seg0 port map (ir_out(7 downto 4),hex1);
ic4:char_7seg0 port map (ir_out(11 downto 8),hex2);
ic5:char_7seg0 port map (ir_out(15 downto 12),hex3);
------------------------
ic6:char_7seg0 port map (addr(3 downto 0),hex0);
ic7:char_7seg0 port map (addr(7 downto 4),hex1);
ic8:char_7seg0 port map (addr(11 downto 8),hex2);
ic9:char_7seg0 port map (addr(15 downto 12),hex3);
----------
ledr(15 downto 0)<=ir_out;
ledr(17 downto 16)<=sw(17 downto 16);
ledg(7 downto 0)<=addr(7 downto 0);
--read process 107

end behaviour;