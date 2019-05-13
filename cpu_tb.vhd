
library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use WORK.MICROPROCESSOR_LIB.ALL;
 
use std.textio.all;
 
entity cpu_tb is

end cpu_tb;

 
 
architecture behavior of cpu_tb is
  Constant   CLKTIME   :       time      := 20 ns;

  signal clk :       std_logic := '0';
  signal Reset :      std_logic := '0';
  signal nReset :      std_logic := '0';
  
  signal addr : std_logic_vector( MADDR_WIDTH-1 downto 0);
  signal  wen  :       std_logic;
  signal  datain :  std_logic_vector(DATA_WIDTH -1 downto 0);
  
  signal  ren :       std_logic;
 
  signal dataout :   std_logic_vector(DATA_WIDTH -1 downto 0);
Begin
-- write your code here
-- Clock generation
 Clk <= not clk after CLKTIME/2;  
-- UUT componenet
dut_pro: cpu 
    Port Map (
	reset => reset,
        clk => clk,
        Data_in => Datain,
        Addr_out => Addr,
        Data_out => Dataout,
        Mre => Ren,
	Mwe => Wen
        );

-- Memory
  nReset <= Not Reset;
  dut_mem:  dpmem
    generic map
    (
      DATA_WIDTH     => DATA_WIDTH,
      ADDR_WIDTH => MADDR_WIDTH
      )
     
    port map (
       
      clk      => clk,
      nReset   => nReset,
      addr     => addr,
      Wen       => wen,
      Datain    => dataout,
      
      Ren       => ren,
      
      Dataout   => datain
      
      );
---   
  stimuli_proc :  process
  Begin
      -- Reset generation
  
        Reset  <= '1'; 
        wait for  50 ns;                                         
        Reset  <= '0';
        wait ;
        
        
  end process stimuli_proc;   
End behavior;