----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2017 12:01:03 AM
-- Design Name: 
-- Module Name: controller - controller
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.MICROPROCESSOR_LIB.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    port(
        reset : in STD_LOGIC; -- high activate reset signal
        -- controller_en : in STD_LOGIC; -- high activate Start: enable CPU
        clk : in STD_LOGIC; -- Clock
        ALUz, ALUeq, ALUgt : in STD_LOGIC;
        Instr_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        RFs : out STD_LOGIC_VECTOR(1 downto 0);
        RFwa : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        RFwe : out STD_LOGIC;
        OPr1a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr1e : out STD_LOGIC;
        OPr2a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr2e : out STD_LOGIC;
        ALUs : out STD_LOGIC_VECTOR(1 downto 0);
        IRld : out STD_LOGIC;
        PCincr : out STD_LOGIC;
        PCclr : out STD_LOGIC;
        PCld : out STD_LOGIC;
        Addr_sel : out STD_LOGIC_VECTOR(1 downto 0);
        Mre : out STD_LOGIC;
        Mwe : out STD_LOGIC --;
        --OP2 : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0)
    );
end controller;

architecture controller of controller is
    type state_type is (RESET_S, FETCH, FETCHa, FETCHb, DECODE, MOV1, MOV1a, MOV1b, MOV2, MOV2a, MOV2b,
                    MOV3, MOV3a, MOV3b, MOV4, MOV4a, ADD, ADDa, ADDb, SUB, SUBa, SUBb, RSB, RSBa, RSBb,
                     XOR_S, XOR_Sa, XOR_Sb, OR_S, OR_Sa, OR_Sb, AND_S, AND_Sa, AND_Sb, JZ, JZa, JZb, JEQ,JEQa, JEQb, 
                     JGT,JGTa, JGTb, JLT, JLTa, JLTb, CLR, CLRa, CLRb, PRS, PRSa, PRSb, NOP);

		signal OPcode:std_LOGIC_VECTOR(3 downto 0);
		signal state:state_type;
		
		SIGnal RN,rm: STD_LOGIC_VECTOR(3 downto 0);
		
begin
OPCode<=Instr_in(15 downto 12);
rn<=Instr_in(11 downto 8);--khai bao ra thi gan gia tri cho no
rm<=Instr_in(7 downto 4);--4 bit tiep theo
process(reset,clk,opcode)
begin
if reset='1'  then
state<=resET_S;
elsif clk'event and clk='1' then
 case state is 
		WheN REsET_S=>
		state<=fetCH;
		when fetCH=>
		state<=fetCHa;
		when fetCHa=>
		state<=fetCHb;
		when fetCHb=>
		state<=decODE;
		casE opcode is
		
		
			WHEN "0000" => state <= MOV1;
			WHEN "0001" => state <= MOV2;
			WHEN "0010" => state <= MOV3;
			WHEN "0011" => state <= MOV4;
			WHEN "0100" => state <= ADD;
			WHEN "0101" => state <= SUB;
			WHEN "0110" => state <= JZ;
			WHEN "0111" => state <= OR_S;
			WHEN "1000" => state <= AND_S;
			
			WHEN OTHERS => state <=NOP ;
		END CASE;
		when MOV1 =>
		STAte<=Mov1a;
		Ms <= '01'; -- load IR
		Mre <= '1';
		
		
		when MOV1a =>
		RFs <= '10'; -- increment PC
	RFWa <= rn;
	RFwe <= '1';
		STAte<=fetCH;
		
		
		when MOV2 =>
		STAte<=Mov2a;
		
		when MOV2a =>
		STAte<=fetCH;
		
		when MOV3 =>
		STAte<=Mov3a;
		
		when MOV3a =>
		STAte<=fetCH;
		
		when MOV4 =>
		RFs="01";
		RFwa='rn';
		RFWe='1';
		STAte<=fetCH;
		
		when Add =>
		STAte<=Adda;
		
		when Adda =>
		STAte<=fetCH;
		
		when sub =>
		STAte<=suba;
		
		when suba =>
		STAte<=fetCH;
		
		When othERS=>state<=resET_S;
		end casE;
end if;
		end proCESS;
		

--output function
	PCclr<='1' when state<=resET_S else '0';
	PCincr<='1' when state<=fetCHb else '0';
	PCld<= ALUz when state<=Jza else '0';
	--for ir
		IRld<='1' when state<=fetCHa else '0';
		
		----song song va nam ngoai process nen khong the dung case
		--with selecting memory address
	with state select addr_sel<="10" when fetCH,
		"01" when mov1|mov2a,
		"00" when mov3a,
		"11" when othER;
		--enable memory reading	
	with state select mre<='1' when fetCH|mov1,
		'0' when othERs;
			--enable memory writing	
	with state select mwe<='1' when mov2a|mov3a,
		'0' when othERs;
		--write RFs
	with state select RFs<="10" when mov1a,
								"01" when mov4,
								"00" when Adda||Suba,
								"11" when othER;
								
	with state select RFWa<="10" when mov1a,
								"01" when mov4,
								"00" when Adda||Suba,
								"11" when othER;
								
	
										
end controller;