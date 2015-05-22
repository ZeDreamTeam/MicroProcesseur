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
 
COMPONENT PIPELINE is
  port(
    CLK :     in  STD_LOGIC;
    AIN :     in  STD_LOGIC_VECTOR(7 downto 0);
    BIN :     in  STD_LOGIC_VECTOR(7 downto 0);
    CIN :     in  STD_LOGIC_VECTOR(7 downto 0);
    OPIN :    in  STD_LOGIC_VECTOR(7 downto 0);
    AOUT :    out STD_LOGIC_VECTOR(7 downto 0);
    BOUT :    out STD_LOGIC_VECTOR(7 downto 0);
    COUT :    out STD_LOGIC_VECTOR(7 downto 0);
    OPOUT :   out STD_LOGIC_VECTOR(7 downto 0)
  );
end COMPONENT;
    

   --Inputs
   signal CLK :   STD_LOGIC := '0';
   signal AIN :   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal BIN :   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal CIN :   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal OPIN:   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
 	--Outputs
   signal AOUT :   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal BOUT :   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal COUT :   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal OPOUT:   STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PIPELINE PORT MAP (
          CLK,
          AIN,
          BIN,
          CIN,
          OPIN,
          AOUT,
          BOUT,
          COUT,
          OPOUT
        );
   CLK_process : process
   begin
        CLK <= not CLK;
        wait for CLK_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin
    -- Testing multiplication
    wait for CLK_period*2;
      AIN <= X"CA";
    -- Testing mult with overflows
    wait for CLK_period*2;
      BIN <= X"AC";

    -- Testing huge mult with overflows
    wait for CLK_period*2;
      AIN <= X"00";
      BIN <= X"00";
      CIN <= X"CA";

    -- Testing add.
    wait for CLK_period*2;
      OPIN <= X"FF";
   end process;

END;
