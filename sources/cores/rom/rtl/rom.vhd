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

entity Rom is
    generic(
        MAX_WORDS : positive := 256;
        WORD_SIZE : positive := 32
    ); 

    port(
        EN  :   in STD_LOGIC;
        CLK :   in STD_LOGIC;
        ADR :   in STD_LOGIC_VECTOR(7 downto 0);
        RIN :   in STD_LOGIC_VECTOR(WORD_SIZE-1 downto 0);
        ROUT:   out STD_LOGIC_VECTOR(WORD_SIZE-1 downto 0)  
    );

end Rom;

architecture Behavioral of Rom is
    subtype word is std_logic_vector(WORD_SIZE-1 downto 0);
    type word_list is array(0 to MAX_WORDS-1) of word;
    
    signal instructionMemory : word_list := (0 => X"06011254", 1=>X"06021254",2=>X"03000201",3=>X"0B000000",4=>X"06026654",5=>X"00000000",6=>X"00000000",7=>X"00000000",8=>X"0B000000",9=>X"00000000", others => X"00000000");
---AFC 3 nop ADD
begin
    process(CLK)
    begin
        if(rising_edge(CLK)) then
            if(EN = '1') then
                ROUT <= instructionMemory(to_integer(unsigned(ADR)));
            else
                ROUT <= RIN;
            end if;
        end if;
    end process;


end Behavioral;


