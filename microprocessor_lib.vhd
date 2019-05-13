----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2017 07:06:59 AM
-- Design Name: 
-- Module Name: microprocessor_lib - Behavioral
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

package microprocessor_lib is
    -- Constant for datapath
    Constant   DATA_WIDTH  :     integer   := 16;     -- Word Width
    Constant   ADDR_WIDTH  :     integer   := 4 ;     -- Address Width
    Constant   MADDR_WIDTH :     integer   := 16;     -- Address Width of Memory 
    --constant PORT_NUM : integer := 5;
    
    -- Type Definition
    -- type ADDR_ARRAY_TYPE is array (VC_NUM-1 DOWNTO 0) of std_logic_vector (ADDR_WIDTH-1 downto 0);
    
    
    -- **************************************************************
    --COMPONENTs
    -- ALU
    component ALU
        Port ( OPr1 : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
            OPr2 : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
            ALUs : in STD_LOGIC_VECTOR (1 downto 0);
            ALUr : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
            ALUz : out STD_LOGIC;
            ALUeq : out STD_LOGIC;
            ALUgt : out STD_LOGIC);
    end component;
        
    -- Program Counter
    component program_counter
            Port ( clk : in STD_LOGIC;
                   PCclr : in STD_LOGIC;
                   PCincr : in STD_LOGIC;
                   PCld : in STD_LOGIC;
                   PC_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
                   PC_out : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
    end component;
    
    -- register file
    component register_file
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               RFin : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
               RFwa : in STD_LOGIC_VECTOR (ADDR_WIDTH - 1 downto 0);
               RFwe : in STD_LOGIC;
               OPr1a : in STD_LOGIC_VECTOR (ADDR_WIDTH - 1 downto 0);
               OPr1e : in STD_LOGIC;
               OPr2a : in STD_LOGIC_VECTOR (ADDR_WIDTH - 1 downto 0);
               OPr2e : in STD_LOGIC;
               OPr1 : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
               OPr2 : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
    end component;
    
    -- memory

    
    -- Instruction Register
    component instruction_register
        Port ( clk : in STD_LOGIC;
               IR_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
               IRld : in STD_LOGIC;
               IR_out : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
    end component;
    
    -- Multiplexer 3 to 1
    component mux3to1
        port( data_in0, data_in1, data_in2 : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
            sel : in STD_LOGIC_VECTOR(1 downto 0);
            data_out : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0)
        );
    end component;

    -- Controller
    component controller
        port(
            reset : in STD_LOGIC; -- high activate reset signal
            -- start : in STD_LOGIC; -- high activate Start: enable CPU
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
    end component;

    -- Data path
    component datapath
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
    end component;

    -- CPU
   
    
    -- control unit
    component control_unit
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
    end component;
    
    -- processor
    component cpu
        Port (reset : in STD_LOGIC;
            clk : in STD_LOGIC;
            Data_in : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
            Addr_out : inout STD_LOGIC_VECTOR(MADDR_WIDTH - 1 downto 0);
            Data_out : inout STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
            Mre, Mwe : out STD_LOGIC
            );
    end component;
--------
component dpmem 
  generic (
    DATA_WIDTH        :     integer   := 16;     -- Word Width
    ADDR_WIDTH        :     integer   := 16      -- Address width
    );

  port (
    -- Writing
    Clk              : in  std_logic;          -- clock
	nReset             : in  std_logic; -- Reset input
    addr              : in  std_logic_vector(ADDR_WIDTH -1 downto 0);   --  Address
	-- Writing Port
    Wen               : in  std_logic;          -- Write Enable
    Datain            : in  std_logic_vector(DATA_WIDTH -1 downto 0) := (others => '0');   -- Input Data
    -- Reading Port
    
    Ren               : in  std_logic;          -- Read Enable
    Dataout           : out std_logic_vector(DATA_WIDTH -1 downto 0)   -- Output data
    
    );
end component;
------------------------
end microprocessor_lib;

PACKAGE BODY microprocessor_lib IS
	-- package body declarations

END PACKAGE BODY microprocessor_lib;