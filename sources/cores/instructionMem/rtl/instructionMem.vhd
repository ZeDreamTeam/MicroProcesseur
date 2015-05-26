----------------------------------------------------------------------------------
--Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:23 04/28/2015 
-- Design Name: 
-- Module Name:    bibou - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity INSTRUCTION_MEM is
	port(
		ADDR : 		in  integer range 0 to 255;
		CLK : 		in STD_LOGIC;
		OUT : 		out STD_LOGIC_VECTOR(32 downto 0)
	);
end INSTRUCTION_MEM;

architecture Behavioral of INSTRUCTION_MEM is
	type ROM is array(0 to 255) of STD_LOGIC_VECTOR(32 downto 0);
begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			OUT <= 
		end if;
	end process;
end Behavioral;


