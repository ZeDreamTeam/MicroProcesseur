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

entity ipCounter is
    port(
        CLK    : in STD_LOGIC;
        EN     : in STD_LOGIC;
        COUT    : out unsigned(7 downto 0)
    );

end ipCounter;

architecture Behavioral of ipCounter is
signal counter : unsigned(7 downto 0) := X"00";
begin
    COUT <= counter; 
 process(CLK)
    begin
        if(rising_edge(CLK)) then
            if(EN = '1') then
                counter <= counter + 1;
            end if;
        end if;
    end process;
   
end Behavioral;