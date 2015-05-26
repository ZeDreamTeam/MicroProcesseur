--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:05:21 02/11/2015
-- Design Name:   
-- Module Name:   counter/rtl/test_bench.vhd
-- Project Name:  counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: system
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
  COMPONENT system is
    port(CLK     :       in STD_LOGIC);
  end COMPONENT;
    
   --Inputs
   signal CLK   :       STD_LOGIC := '0';

   constant CLK_period : time := 10 ns;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
 uut: system PORT MAP (
          CLK => CLK
        );
   CLK_process : process
   begin
        CLK <= not CLK;
        wait for CLK_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin
    -- Writing in @0 et @1
    wait for CLK_period*10;
   end process;

END;
