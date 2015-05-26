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
    
    signal memory : word_list;


begin
    process(CLK)
    begin
        if RST='1' then
            memory <= (others => (others => '0'));
        elsif RW='1' then
            ROUT <= memory(conv_integer(unsigned(ADR)));
        elsif RW='0' then 
            memory(conv_integer(unsigned(ADR))) <= RIN;
        end if;
    end process;


end Behavioral;


