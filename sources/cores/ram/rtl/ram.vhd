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

entity Ram is
    generic(
        MAX_WORDS : positive := 256;
        WORD_SIZE : positive := 8
    );

    port(
        CLK     :       in STD_LOGIC;
        RST     :       in STD_LOGIC;
        RW      :       in STD_LOGIC;
        ADR     :       in STD_LOGIC_VECTOR(7 downto 0);
        RIN     :       in STD_LOGIC_VECTOR(WORD_SIZE-1 downto 0);
        ROUT    :       out STD_LOGIC_VECTOR(WORD_SIZE-1 downto 0)
    );

end Ram;

architecture Behavioral of Ram is
    subtype word is std_logic_vector(WORD_SIZE-1 downto 0);
    type word_list is array(0 to MAX_WORDS-1) of word;
    signal memory : word_list := (0 => X"00", 1=>X"00",2=>X"FA",3=>X"CA",4=>X"00",5=>X"00",6=>X"00",7=>X"00",8=>X"00",9=>X"00", others => X"00");

begin
    memory <= (others => (others => '0')) when (RST = '1') else
        RIN & memory(0 to MAX_WORDS-2) when (ADR = X"FF" and RW = '0') else
        memory(1 to MAX_WORDS-1) & RIN when (ADR = X"00" and RW = '0') else
        memory(0 to to_integer(unsigned(ADR))-1) & RIN & memory(to_integer(unsigned(ADR))+1 to MAX_WORDS-1) when (RW = '0');

    ROUT <= memory(to_integer(unsigned(ADR))) when (RW = '1');

   
end Behavioral;