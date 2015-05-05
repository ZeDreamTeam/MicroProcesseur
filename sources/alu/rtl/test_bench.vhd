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
 
  COMPONENT alu
    port(
      CLK :       in  STD_LOGIC;
      A :         in  STD_LOGIC_VECTOR(7 downto 0);
      B :         in  STD_LOGIC_VECTOR(7 downto 0);
      Ctrl_Alu :  in  STD_LOGIC_VECTOR(1 downto 0);
      S :         out STD_LOGIC_VECTOR(7 downto 0);
      N :         out STD_LOGIC;
      O :         out STD_LOGIC;
      Z :         out STD_LOGIC;
      C :         out STD_LOGIC
    );
  END COMPONENT;
    

   --Inputs
   signal CLK :       STD_LOGIC := '0';
   signal A :         STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal B :         STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal Ctrl_Alu :  STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
 	--Outputs
   signal S : STD_LOGIC_VECTOR(7 downto 0);
   signal N : STD_LOGIC;
   signal O : STD_LOGIC;
   signal Z : STD_LOGIC;
   signal C : STD_LOGIC;


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          S => S,
          CLK => CLK,
          Ctrl_Alu => Ctrl_Alu,
          N => N,
          O => O,
          Z => Z,
          C => C
        );

 
   -- Stimulus process
   stim_proc: process
   begin		
    wait;
   end process;

END;