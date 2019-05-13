----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2017 12:33:59 PM
-- Design Name: 
-- Module Name: mux3to1 - mux3to1
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

entity mux3to1 is
    port( data_in0, data_in1, data_in2 : in STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
        sel : in STD_LOGIC_VECTOR(1 downto 0);
        data_out : out STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0)
    );
end mux3to1;

architecture mux3to1 of mux3to1 is

begin
with sel select
data_out<=data_in0 when "00"
data_in1 when "01"
data_in2 when others;
		
end mux3to1;
