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
library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

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
		A : 		in 	unsigned(7 downto 0) ;
		B : 		in 	unsigned(7 downto 0) ;
		Ctrl_Alu : 	in 	STD_LOGIC_VECTOR(2 downto 0);
		S : 		out	STD_LOGIC_VECTOR(7 downto 0);
		N : 		out STD_LOGIC;
		O : 		out STD_LOGIC;
		Z : 		out STD_LOGIC;
		C : 		out STD_LOGIC
	);
end ALU;

architecture Behavioral of ALU is
	signal tmp : unsigned(15 downto 0);
begin
	tmp <= (X"00" & A) + B when (Ctrl_Alu = B"001") else
		(X"00" & A)- B when (Ctrl_Alu = B"010") else
		A * B when (Ctrl_Alu = B"011");

	Z <= '1' when (tmp = "0000") else
		'0' ;
	N <= '1' when (Ctrl_Alu = B"010" and B > A) else 
		'0' ;
	

	O <= '1' when (tmp > X"00FF" and Ctrl_Alu /= B"010") else
		 '0' ;

	C <= '1' when (Ctrl_Alu = B"001" and tmp > X"00FF") else
		 '0' ;

	S <= std_logic_vector(tmp(7 downto 0));
end Behavioral;


