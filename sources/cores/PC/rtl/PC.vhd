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



entity PC is
    port(
        EN  :   in STD_LOGIC;
        SEL :   in STD_LOGIC_VECTOR(1 downto 0);
        CLK :   in STD_LOGIC;
        IZ :    in STD_LOGIC;
        ADR :   in STD_LOGIC_VECTOR(7 downto 0);
        COUT:   out unsigned(7 downto 0)
    );

end PC;

architecture Behavioral of PC is
    signal currentAddress : unsigned(7 downto 0) := X"00";
begin
    COUT <= currentAddress;
    process(CLK)
    begin
        if(rising_edge(CLK)) then
            if(EN ='1') then
                if(SEL = B"01") then
                    currentAddress <= unsigned(ADR);
                elsif(SEL = B"10" and IZ = '1') then
                    currentAddress <= unsigned(ADR);
                else
                    currentAddress <= currentAddress + 1;
                end if;
            end if;
        end if;
    end process;


end Behavioral;


