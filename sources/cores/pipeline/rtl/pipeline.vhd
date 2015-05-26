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

entity PIPELINE is
	port(
		CLK : 		in 	STD_LOGIC;
		AIN : 		in  STD_LOGIC_VECTOR(7 downto 0);
        BIN : 		in 	STD_LOGIC_VECTOR(7 downto 0);
        CIN : 		in 	STD_LOGIC_VECTOR(7 downto 0);
        OPIN : 		in 	STD_LOGIC_VECTOR(7 downto 0);
        AOUT : 		out STD_LOGIC_VECTOR(7 downto 0);
        BOUT : 		out STD_LOGIC_VECTOR(7 downto 0);
        COUT : 		out STD_LOGIC_VECTOR(7 downto 0);
        OPOUT : 	out STD_LOGIC_VECTOR(7 downto 0)
	);
end PIPELINE;

architecture Behavioral of PIPELINE is
begin
	process(CLK)
	begin
	if(rising_edge(CLK)) then
		AOUT <= AIN;
		BOUT <= BIN;
		COUT <=CIN;
		OPOUT <= OPIN;
		end if;
	end process;
end Behavioral;


