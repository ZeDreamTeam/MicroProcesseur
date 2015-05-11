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
 
  COMPONENT reg_bench is
    port(
      CLK   :     in STD_LOGIC;
      RST   :   in STD_LOGIC;
      ADR_A   :   in STD_LOGIC_VECTOR(3 downto 0);
      ADR_B   :     in STD_LOGIC_VECTOR(3 downto 0);
      ADR_W :   in STD_LOGIC_VECTOR(3 downto 0);
      W     :     in STD_LOGIC;
      DATA  :   in STD_LOGIC_VECTOR(7 downto 0);
      QA    :     out STD_LOGIC_VECTOR(7 downto 0);
      QB    :     out STD_LOGIC_VECTOR(7 downto 0)
    );
  end COMPONENT;
    

   --Inputs
   signal CLK :       STD_LOGIC := '0';
   signal RST :       STD_LOGIC := '0';
   signal ADR_A :     STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
   signal ADR_B :     STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
   signal ADR_W :     STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
   signal W     :     STD_LOGIC:= '0';
   signal DATA  :     STD_LOGIC_VECTOR(7 downto 0) := (others => '0');


 	--Outputs
   signal QA : STD_LOGIC_VECTOR(7 downto 0);
   signal QB : STD_LOGIC_VECTOR(7 downto 0);

   constant CLK_period : time := 10 ns;
 
BEGIN

  -- Instantiate the Unit Under Test (UUT)
 uut: REG_bench PORT MAP (
          ADR_A => ADR_A,
          ADR_B => ADR_B,
          ADR_W => ADR_W,
          CLK => CLK,
          W => W,
          DATA => DATA,
          QA => QA,
          QB => QB,
          RST => RST
        );
   CLK_process : process
   begin
        CLK <= not CLK;
        wait for CLK_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin
    -- Testing RST
    wait for CLK_period*10;
      RST <= '1';
    wait for CLK_period*10;
      RST <= '0';
    -- Update Reg 0
    wait for CLK_period*10;
      DATA <= X"FF";
      ADR_W <= X"0";
      W <= '1';
    -- Update Reg 1
    wait for CLK_period*10;
      DATA <= X"0F";
      ADR_W <= X"1";
      W <= '1';
    -- Read Reg 0 & 1
    wait for CLK_period*10;
      W <= '0';
      ADR_A <= X"0";
      ADR_B <= X"1";



   end process;

END;
