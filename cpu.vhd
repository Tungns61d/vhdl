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

begin

end cpu_struct;
