----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2017 12:11:11 PM
-- Design Name: 
-- Module Name: datapath - datapath
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

entity datapath is
    Port(reset : in STD_LOGIC;
        clk: in STD_LOGIC;

        data_in1 : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        data_in2 : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        RFs : in STD_LOGIC_VECTOR(1 downto 0);
        RFwa, OPr1a, OPr2a : in STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        RFwe, OPr1e, OPr2e : in STD_LOGIC;
        ALUs : in STD_LOGIC_VECTOR(1 downto 0);
        ALUz : out STD_LOGIC;
        ALUeq : out STD_LOGIC;
        ALUgt : out STD_LOGIC;
	Addr_out : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        data_out : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0)
        );
end datapath;

architecture datapath_arc of datapath is
signal ALUr std_LOGIC_vECTOR(datA_WIDTH - 1 downto 0);
signal RFin std_LOGIC_vECTOR(datA_WIDTH - 1 downto 0);
signal OPR1,OPR2 std_LOGIC_vECTOR(datA_WIDTH - 1 downto 0);


begin
mux3to1_ic1:mux3to1 port map (data_in0=>alur,data_in1=>data_in1,data_in2=>data_in2,sel=>RFs,data_out=>RFin );
rf_ic2: register_file port map (
	reset => reset,
	clk =>clk,
	RFin =>RFin,
	RFwa =>RFwa,
	RFwe =>RFwe,
	OPr1a =>OPr1a,
	OPr1e =>OPr1e,
	OPr2a =>OPr2a,
	OPr2e =>OPr2e,
	OPr1 =>OPr1,
	OPr2 =>OPr2
);
alu_ic3: alu port map(
	OPr1 =>OPr1,
	OPr2 =>OPr2,
	ALUs => ALUs,
	ALUr => ALUr,
	ALUz => ALUz
	
);

--address_out tuong ung OPR2;
Addr_out<=opr2;
data_out<=opr1;



--mo ta phan ghi du lieu vao rf

end datapath_arc;
