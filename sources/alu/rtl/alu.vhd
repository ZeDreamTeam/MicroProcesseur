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

entity ALU is
	port(
		CLK : 		in 	STD_LOGIC;
		A : 		in  STD_LOGIC_VECTOR(7 downto 0);
        B : 		in 	STD_LOGIC_VECTOR(7 downto 0);
		Ctrl_Alu : 	in STD_LOGIC_VECTOR(2 downto 0);
		S : 		out STD_LOGIC_VECTOR(7 downto 0);
		N : 		out STD_LOGIC;
		O : 		out STD_LOGIC;
		Z : 		out STD_LOGIC;
		C : 		out STD_LOGIC
	);
end ALU;

architecture Behavioral of ALU is

begin
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			if Ctrl_Alu = X"01" then
				S <= A + B;
			elsif Ctrl_Alu = X"02" then
				S <= A - B;

			end if;
		end if;			
	end process;
	
		


end Behavioral;


