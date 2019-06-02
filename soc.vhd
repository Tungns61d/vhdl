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
--component ramp
--port
--(
--	address:in std_logic_vector(7 downto 0);
--	clock:in std_logic;
--	data:in std_logic_vector(15 downto 0);
--	wren:in std_logic;
--	q:out std_logic_vector(15 downto 0)
--);	--34
--end component;

--component clk1Hz port(clk_in: in  STD_LOGIC;reset:in STD_LOGIC;enable: in  STD_LOGIC;clk_out: out STD_LOGIC);end component;
component char_7seg0 port(C: IN STD_LOGIC_VECTOR(3 DOWNTO 0); Display : OUT STD_LOGIC_VECTOR(6 downto 0));end component;
--component char_7seg1 port(C: IN STD_LOGIC_VECTOR(3 DOWNTO 0); Display : OUT STD_LOGIC_VECTOR(6 downto 0));end component;
--component char_7seg2 port(C: IN STD_LOGIC_VECTOR(3 DOWNTO 0); Display : OUT STD_LOGIC_VECTOR(6 downto 0));end component;
--component dpmem port ( Clk: in  std_logic;nReset: in  std_logic;addr: in  std_logic_vector(15 downto 0);Wen:in  std_logic;Datain:in  std_logic_vector(15 downto 0) := (others => '0');Ren: in  std_logic; Dataout : out std_logic_vector(15 downto 0)  );end component;
component dpmem
 port (
    -- Writing
	Clk              : in  std_logic;          -- clock
	nReset             : in  std_logic;	 -- Reset input
    addr              : in  std_logic_vector( DATA_WIDTH-1 downto 0);   --  Address
	-- Writing Port
    Wen               : in  std_logic;          -- Write Enable
    Datain            : in  std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');   -- Input Data
    -- Reading Port
    
    Ren               : in  std_logic;          -- Read Enable
    Dataout           : out std_logic_vector(DATA_WIDTH-1 downto 0)   -- Output data
    
    );
end component;
component register_123 port( clk : in STD_LOGIC;reset:in STD_LOGIC;Data_in : in STD_LOGIC_VECTOR(DatA_WIDTH - 1 downto 0);wen : in STD_LOGIC;ir_out : OUT STD_lOGIC_VECTOR(DatA_WIDTH-1 DOWNTO 0));end component;
      
signal clk,wen,ren,reset,nreset:std_logic;
signal addr :std_logic_vector(data_width-1 downto 0);--43


signal datain:std_logic_vector(data_width-1 downto 0);
signal dataout:std_logic_vector(data_width-1 downto 0);--47
signal cnt_out:std_logic_vector (fdiv-1 downto 0);--signal cnt_out:std_logic;
signal ir_out:std_logic_vector (data_width-1 downto 0);

signal Rwen,Mwen,Mren:std_logic;--51

begin

Mren<=Ren and (not(addr(12)or addr(13) or addr(14) or addr(15)));
MWen<=wen and (not(addr(12)or addr(13) or addr(14) or addr(15)));
Rwen<=wen and (not((not addr(12)) or addr(13) or addr(14) or addr(15)));
ledg(8)<=rwen;
--clock generate
clk<=clock_50;--clk<=cnt_out(22);
--clk_gen: clk1Hz 
--generic map (data_width=>24) 
--port map (clock_50,reset,sw(16),cnt_out(22));--them 1 line
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
	mre=>Ren,
	mwe=>wen
	);
		
nreset<=not(reset);
memory:dpmem--75 ---memory:ramp
generic map (data_width=>16)
port map (
clk	=>clk, --clk=>clk,
nReset=>nreset,--address	=> addr(7 downto 0)
addr => addr,
Datain=>dataout,--addr=>addr(15 downto 0),
ren	=>mren,--datain=>dataout,--82--wen		=> mwen
wen =>Mwen,
Dataout=>datain		--		Dataout		=>datain,--Ren =>rwen,
	);

maybeRegister:register_123 
--maybe_register_cuoi
generic map (data_width=>16)--91
port map (clk=>clk,reset=>reset,Data_in=>dataout,wen=>rwen,ir_out=>ir_out);
------------------
ic2:char_7seg0 port map (ir_out(3 downto 0),hex0);
ic3:char_7seg0 port map (ir_out(7 downto 4),hex1);
ic4:char_7seg0 port map (ir_out(11 downto 8),hex2);
ic5:char_7seg0 port map (ir_out(15 downto 12),hex3);
------------------------
ic6:char_7seg0 port map (addr(3 downto 0),hex4);
ic7:char_7seg0 port map (addr(7 downto 4),hex5);
ic8:char_7seg0 port map (addr(11 downto 8),hex6);
ic9:char_7seg0 port map (addr(15 downto 12),hex7);
----------
ledr(15 downto 0)<=ir_out;
ledr(17 downto 16)<=sw(17 downto 16);
ledg(7 downto 0)<=addr(7 downto 0);
--read process 107

end behaviour;