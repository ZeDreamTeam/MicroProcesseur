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

entity REG_bench is
	port(
		CLK 	: 		in STD_LOGIC;
		RST 	:		in STD_LOGIC;
		ADR_A 	:		in STD_LOGIC_VECTOR(3 downto 0);
		ADR_B 	: 		in STD_LOGIC_VECTOR(3 downto 0);
		ADR_W	:		in STD_LOGIC_VECTOR(3 downto 0);
		W 		: 		in STD_LOGIC;
		DATA	:		in STD_LOGIC_VECTOR(7 downto 0);
		QA 		: 		out STD_LOGIC_VECTOR(7 downto 0);
		QB 		: 		out STD_LOGIC_VECTOR(7 downto 0)
	);
end REG_bench;

architecture Behavioral of REG_bench is
	type regb is array (15 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal registers : regb;
begin
	--Reading
	QA <= registers(conv_integer(unsigned(ADR_A))) when (W='0');
	QB <= registers(conv_integer(unsigned(ADR_B))) when (W='0');
	
	-- reset
	process(CLK, RST,W)
	begin
		if RST='1' then
			registers <= (X"00", X"00", X"00", X"00",
				X"00", X"00", X"00", X"00",
				X"00", X"00", X"00", X"00",
				X"00", X"00", X"00", X"00");
		end if;
		if W='1' then
			registers(conv_integer(unsigned(ADR_W))) <= DATA;
		end if;
	end process;
	


end Behavioral;


