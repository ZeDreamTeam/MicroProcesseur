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
 
  COMPONENT Rom is
    generic(
        MAX_WORDS : positive := 256;
        WORD_SIZE : positive := 32
    );

    port(
        CLK     :       in STD_LOGIC;
        ADR     :       in STD_LOGIC_VECTOR(7 downto 0);
        ROUT    :       out STD_LOGIC_VECTOR(WORD_SIZE-1 downto 0)
    );
  end COMPONENT;
    
   constant WORD_SIZE : integer := 32;
   constant MAX_WORDS : integer := 256;

   --Inputs
   signal CLK   :       STD_LOGIC := '0';
   signal ADR   :       STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   

    --Outputs
   signal ROUT  :       STD_LOGIC_VECTOR(WORD_SIZE-1 downto 0) := (others => '0');
   
   constant CLK_period : time := 10 ns;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
 uut: Rom GENERIC MAP (
        MAX_WORDS => MAX_WORDS,
        WORD_SIZE => WORD_SIZE
    ) PORT MAP (
          CLK => CLK,
          ADR => ADR,
          ROUT => ROUT
        );
   CLK_process : process
   begin
        CLK <= not CLK;
        wait for CLK_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin
    -- Reading @0 and @1
    wait for CLK_period*10;
      ADR <= X"00";
    wait for CLK_period*10;
      ADR <= X"01";


   end process;

END;
