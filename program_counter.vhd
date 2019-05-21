----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2017 12:33:30 AM
-- Design Name: 
-- Module Name: program_counter - program_counter
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.MICROPROCESSOR_LIB.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_counter is
    Port ( clk : in STD_LOGIC;
           PCclr : in STD_LOGIC;
           PCincr : in STD_LOGIC;
           PCld : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           PC_out : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
end program_counter;

architecture program_counter of program_counter is
signal pc_z: std_LOGIC_VECTOR( datA_WIDTH -1 downto 0);
begin
   process(clk,PCclr)
	begin
	if(PCclr='1') then
	PC_out<=(Others =>'0');

	elsif (clk='1' and clk'event) then
		if (PCld='1') then	
			pc_z<=pc_in;
		elsif (PCincr='1') then
			pc_z<=pc_z+1;
		else null;
		end if;

	end if;
end process;
pc_out<=pc_z;
end program_counter;