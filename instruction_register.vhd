----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2017 07:08:11 PM
-- Design Name: 
-- Module Name: instruction_register - instruction_register
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


entity instruction_register is
    Port ( clk : in STD_LOGIC;
           IR_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           IRld : in STD_LOGIC;
           IR_out : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
end instruction_register;

architecture instruction_register of instruction_register is
--signal ir_z: std_LOGIC_VECTOR( datA_WIDTH -1 downto 0);
begin
 process(clk,irld,ir_in)
 begin
 if (clk='1' and clk'event) then
--ir_z<=ir_in;
 if(IRLd='1') then
 ir_out<=ir_in;
--ir_z<=ir_in;
-- elsif ir_out<=(others=>'0');
 end if;
 end if;
 end process;

--ir_out<=ir_z;
end instruction_register;