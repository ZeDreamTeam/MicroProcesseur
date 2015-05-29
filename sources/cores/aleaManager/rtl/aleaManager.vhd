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

entity ALEAMANAGER is

	port(
		CLK : 	in 	STD_LOGIC;
		RIN : 	in 	STD_LOGIC_VECTOR(31 downto 0);
		DAIN : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		EAIN : 	in 	STD_LOGIC_VECTOR(7 downto 0);
		DOPIN :	in 	STD_LOGIC_VECTOR(7 downto 0);
		EOPIN :	in 	STD_LOGIC_VECTOR(7 downto 0);
		ROUT : out	STD_LOGIC_VECTOR(31 downto 0);
		EN : 	out STD_LOGIC
	);
end ALEAMANAGER;

architecture Behavioral of ALEAMANAGER is
begin
	ROUT <= X"00000000" when 
		(
			(
				(	
					RIN(31 downto 24) = X"01" or 
					RIN(31 downto 24) = X"02" or 
					RIN(31 downto 24) = X"03" or 
					RIN(31 downto 24) = X"04" 
				) 
				and 
				(
					
					(
						DAIN = RIN(15 downto 8) and
						DOPIN /= X"00" and
						DOPIN /= X"0A" and
						DOPIN /= X"0B" and 
						DOPIN /= X"08"
					) 
					or
					( 
						DAIN = RIN(7 downto 0) and
						DOPIN /= X"00" and
						DOPIN /= X"0A" and
						DOPIN /= X"0B" and
						DOPIN /= X"08"
					)
					or
					(
					
						EAIN = RIN(15 downto 8) and
						EOPIN /= X"00" and
						EOPIN /= X"0A" and
						EOPIN /= X"0B" and 
						EOPIN /= X"08"
					) 
					or
					( 
						EAIN = RIN(7 downto 0) and
						EOPIN /= X"00" and
						EOPIN /= X"0A" and
						EOPIN /= X"0B" and 
						EOPIN /= X"08"
					)	
				)
			)
			or
			( 
				(
					(
						RIN(31 downto 24) = X"05" or 
						RIN(31 downto 24) = X"08"
					) 
					and 
					(
						(
							DAIN = RIN(15 downto 8)	and
							DOPIN /= X"00" and
							DOPIN /= X"0A" and
							DOPIN /= X"0B" and
							DOPIN /= X"08"
						)
						or
						(
							EAIN = RIN(15 downto 8) and
							EOPIN /= X"00" and
							EOPIN /= X"0A" and
							EOPIN /= X"0B" and 
							EOPIN /= X"08"
						)
					) 
				)
			)  
		)
		else
			RIN;

	EN <= '0' when 
		(
			(
				(	
					RIN(31 downto 24) = X"01" or 
					RIN(31 downto 24) = X"02" or 
					RIN(31 downto 24) = X"03" or 
					RIN(31 downto 24) = X"04" 
				) 
				and 
				(
					
					(
						DAIN = RIN(15 downto 8) and
						DOPIN /= X"00" and
						DOPIN /= X"0A" and
						DOPIN /= X"0B" and 
						DOPIN /= X"08"
					) 
					or
					( 
						DAIN = RIN(7 downto 0) and
						DOPIN /= X"00" and
						DOPIN /= X"0A" and
						DOPIN /= X"0B" and
						DOPIN /= X"08"
					)
					or
					(
					
						EAIN = RIN(15 downto 8) and
						EOPIN /= X"00" and
						EOPIN /= X"0A" and
						EOPIN /= X"0B" and 
						EOPIN /= X"08"
					) 
					or
					( 
						EAIN = RIN(7 downto 0) and
						EOPIN /= X"00" and
						EOPIN /= X"0A" and
						EOPIN /= X"0B" and 
						EOPIN /= X"08"
					)	
				)
			)
			or
			( 
				(
					(
						RIN(31 downto 24) = X"05" or 
						RIN(31 downto 24) = X"08"
					) 
					and 
					(
						(
							DAIN = RIN(15 downto 8)	and
							DOPIN /= X"00" and
							DOPIN /= X"0A" and
							DOPIN /= X"0B" and
							DOPIN /= X"08"
						)
						or
						(
							EAIN = RIN(15 downto 8) and
							EOPIN /= X"00" and
							EOPIN /= X"0A" and
							EOPIN /= X"0B" and 
							EOPIN /= X"08"
						)
					) 
				)
			)  
		)
		else
			'1';
			
end Behavioral;


