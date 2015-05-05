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

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
	  S : out  STD_LOGIC_VECTOR(7 downto 0));
end alu;

architecture Behavioral of alu is
	signal Ctrl_Alu : STD_LOGIC_VECTOR(2 downto 0);
	signal Flags : STD_LOGIC_VECTOR(4 downto 0);
begin
	process
	begin
		wait until Ctrl_Alu'event;
		
		if Ctrl_Alu=X"01" then
			S <= B + A;
		elsif Ctrl_Alu = X"02" then
			S <= B - A;
		elsif Ctrl_Alu = X"03" then
			S <= B * A;
		end if;
	end process;
	
		


end Behavioral;


