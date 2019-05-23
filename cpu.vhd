----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2017 05:13:55 PM
-- Design Name: 
-- Module Name: processor - processor
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

entity cpu is
    Port (reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        Data_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        Addr_out : out STD_LOGIC_VECTOR(MADDR_WIDTH - 1 downto 0);
        Data_out : inout STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        Mre, Mwe : out STD_LOGIC
        );
end cpu;

architecture cpu_struct of cpu is
--signal irout1 :irout(7 downto 0);
signal addr_out_op2,OP2:std_LOGIC_vECTOR(datA_WIDTH - 1 downto 0);
signal RFs,Alus :std_LOGIC_vECTOR(1 downto 0);
signal RFwa,OPr1a,OPr2a :std_LOGIC_vECTOR(3 downto 0);
signal RFwe,OPr1e,OPr2e,aluz,alueq,alugt :std_LOGIc;

component datapath is
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
	Addr_out : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);-- Addr_out<=opr2;
        data_out : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0)
        );
end component datapath;

component control_unit is
port(
        reset : in STD_LOGIC; -- high activate reset signal
        -- controller_en : in STD_LOGIC; -- high activate Start: enable CPU
        clk : in STD_LOGIC; -- Clock
        ALUz, ALUeq, ALUgt : in STD_LOGIC;
        Addr_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        RFs : out STD_LOGIC_VECTOR(1 downto 0);
        RFwa : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        RFwe : out STD_LOGIC;
        OPr1a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr1e : out STD_LOGIC;
        OPr2a : out STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
        OPr2e : out STD_LOGIC;
        ALUs : out STD_LOGIC_VECTOR(1 downto 0);

        OP2 : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);

        Mem_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        Mre : out STD_LOGIC;
        Mwe : out STD_LOGIC;
        Addr_out : out STD_LOGIC_VECTOR(MADDR_WIDTH - 1 downto 0)
    );
end component control_unit;


begin

datapath1_ic1:datapath Port map
		(reset =>reset,
        clk=>clk,

        data_in1 =>OP2,
   	     data_in2 =>data_in,

        RFs => RFs,
        RFwa=>RFwa,
		  OPr1a=>OPr1a,
		  OPr2a =>OPr2a,
        RFwe => RFwe,
		  OPr1e=>OPr1e,
		  OPr2e => OPr2e,
        ALUs =>ALUs,
        ALUz =>ALUz,
        ALUeq =>ALUeq,
        ALUgt =>ALUgt,
	Addr_out =>Addr_out_op2,-- Addr_out<=opr2;
        data_out =>data_out
        );
control_unit_ic2:control_unit port map(
        reset =>reset,
        -- controller_en : in STD_LOGIC; -- high activate Start: enable CPU
        clk =>clk,
        ALUz=>ALUz,
		  ALUeq=>ALUeq,
		  ALUgt=>ALUgt,
        Addr_in =>addr_out_op2,
        RFs =>RFs,
        RFwa =>RFwa,
        RFwe =>RFwe,
        OPr1a =>OPr1a,
        OPr1e =>OPr1e,
        OPr2a =>OPr2a,
        OPr2e =>OPr2e,
        ALUs =>ALUs,

        OP2 =>OP2,

        Mem_in =>data_in,
        Mre =>Mre,
        Mwe =>Mwe,
        Addr_out =>Addr_out
    );



end cpu_struct;
