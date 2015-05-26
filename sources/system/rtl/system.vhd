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

entity system is

    port(
        CLK     :       in STD_LOGIC
    );

end system;

architecture Behavioral of system is
    signal ip : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    component pipeline  port(   CLK :       in  STD_LOGIC;
                                AIN :       in  STD_LOGIC_VECTOR(7 downto 0);
                                BIN :       in  STD_LOGIC_VECTOR(7 downto 0);
                                CIN :       in  STD_LOGIC_VECTOR(7 downto 0);
                                OPIN :      in  STD_LOGIC_VECTOR(7 downto 0);
                                AOUT :      out STD_LOGIC_VECTOR(7 downto 0);
                                BOUT :      out STD_LOGIC_VECTOR(7 downto 0);
                                COUT :      out STD_LOGIC_VECTOR(7 downto 0);
                                OPOUT :     out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    component reg port( CLK     :       in STD_LOGIC;
                        RST     :       in STD_LOGIC;
                        ADR_A   :       in STD_LOGIC_VECTOR(3 downto 0);
                        ADR_B   :       in STD_LOGIC_VECTOR(3 downto 0);
                        ADR_W   :       in STD_LOGIC_VECTOR(3 downto 0);
                        W       :       in STD_LOGIC;
                        DATA    :       in STD_LOGIC_VECTOR(7 downto 0);
                        QA      :       out STD_LOGIC_VECTOR(7 downto 0);
                        QB      :       out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    component alu port( CLK :       in  STD_LOGIC;
                        A :         in  STD_LOGIC_VECTOR(7 downto 0);
                        B :         in  STD_LOGIC_VECTOR(7 downto 0);
                        Ctrl_Alu :  in STD_LOGIC_VECTOR(2 downto 0);
                        S :         out STD_LOGIC_VECTOR(7 downto 0);
                        N :         out STD_LOGIC;
                        O :         out STD_LOGIC;
                        Z :         out STD_LOGIC;
                        C :         out STD_LOGIC);
  end component;

    component rom  port( CLK     :       in STD_LOGIC;
                            ADR     :       in STD_LOGIC_VECTOR(7 downto 0);
                            ROUT    :       out STD_LOGIC_VECTOR(31 downto 0));
  end component;

    component ram port( CLK     :       in STD_LOGIC;
                        RST     :       in STD_LOGIC;
                        RW      :       in STD_LOGIC;
                        ADR     :       in STD_LOGIC_VECTOR(7 downto 0);
                        RIN     :       in STD_LOGIC_VECTOR(7 downto 0);
                        ROUT    :       out STD_LOGIC_VECTOR(7 downto 0));
  end component;


  type pipelineT is record
    CLK :   STD_LOGIC;
    AIN :   STD_LOGIC_VECTOR(7 downto 0);
    BIN :   STD_LOGIC_VECTOR(7 downto 0);
    CIN :   STD_LOGIC_VECTOR(7 downto 0);
    OPIN :  STD_LOGIC_VECTOR(7 downto 0);
    AOUT :  STD_LOGIC_VECTOR(7 downto 0);
    BOUT :  STD_LOGIC_VECTOR(7 downto 0);
    COUT :  STD_LOGIC_VECTOR(7 downto 0);
    OPOUT : STD_LOGIC_VECTOR(7 downto 0);
  end record;

    type regT is record
    CLK    : STD_LOGIC;
    RST    : STD_LOGIC;
    ADR_A  : STD_LOGIC_VECTOR(3 downto 0);
    ADR_B  : STD_LOGIC_VECTOR(3 downto 0);
    ADR_W  : STD_LOGIC_VECTOR(3 downto 0);
    W      : STD_LOGIC;
    DATA   : STD_LOGIC_VECTOR(7 downto 0);
    QA     : STD_LOGIC_VECTOR(7 downto 0);
    QB     : STD_LOGIC_VECTOR(7 downto 0);
  end record;

  type ramT is record
    CLK :  STD_LOGIC;
    RST :  STD_LOGIC;
    RW  :  STD_LOGIC;
    ADR :  STD_LOGIC_VECTOR(7 downto 0);
    RIN :  STD_LOGIC_VECTOR(7 downto 0);
    ROUT:  STD_LOGIC_VECTOR(7 downto 0);
  end record;

  type romT is record
    CLK : STD_LOGIC;
    ADR : STD_LOGIC_VECTOR(7 downto 0);
    ROUT: STD_LOGIC_VECTOR(31 downto 0);
  end record;

    type aluT is record
        CLK :       STD_LOGIC;
        A :         STD_LOGIC_VECTOR(7 downto 0);
        B :         STD_LOGIC_VECTOR(7 downto 0);
        Ctrl_Alu :  STD_LOGIC_VECTOR(2 downto 0);
        S :         STD_LOGIC_VECTOR(7 downto 0);
        N :         STD_LOGIC;
        O :         STD_LOGIC;
        Z :         STD_LOGIC;
        C :         STD_LOGIC;
  end record;

    signal LIDI : pipelineT;
    signal DIEX : pipelineT;
    signal EXMEM : pipelineT;
    signal MEMRE : pipelineT;
    signal mROM : romT;
    signal mALU : aluT;
    signal mRAM : ramT;
    signal mREG : regT;

begin
  -- Composants
  llidi : pipeline port map(lidi.CLK,
                        lidi.AIN,
                        lidi.BIN,
                        lidi.CIN,
                        lidi.OPIN,
                        lidi.AOUT,
                        lidi.BOUT,
                        lidi.COUT,
                        lidi.OPOUT);

ldiex : pipeline port map(diex.CLK,
                        diex.AIN,
                        diex.BIN,
                        diex.CIN,
                        diex.OPIN,
                        diex.AOUT,
                        diex.BOUT,
                        diex.COUT,
                        diex.OPOUT);

lexmem : pipeline port map(  exmem.CLK,
                            exmem.AIN,
                            exmem.BIN,
                            exmem.CIN,
                            exmem.OPIN,
                            exmem.AOUT,
                            exmem.BOUT,
                            exmem.COUT,
                            exmem.OPOUT);
lmemre : pipeline port map( memre.CLK,
                            memre.AIN,
                            memre.BIN,
                            memre.CIN,
                            memre.OPIN,
                            memre.AOUT,
                            memre.BOUT,
                            memre.COUT,
                            memre.OPOUT);

lrom : rom port map(    mRom.CLK, 
                        mRom.ADR, 
                        mRom.ROUT);
lram : ram port map(    mRam.CLK, 
                        mRam.RST, 
                        mRam.RW, 
                        mRam.ADR,
                        mRam.RIN,
                        mRam.ROUT);

lalu : alu port map(    mAlu.CLK,
                        mAlu.A,
                        mAlu.B,
                        mAlu.Ctrl_Alu,
                        mAlu.S,
                        mAlu.N,
                        mAlu.O,
                        mAlu.Z,
                        mAlu.C);

lreg : reg port map(    mReg.CLK,
                        mReg.RST,
                        mReg.ADR_A,
                        mReg.ADR_B,
                        mReg.ADR_W,
                        mReg.W,
                        mReg.DATA,
                        mReg.QA,
                        mReg.QB);

  -- Connexion
    lidi.CLK <= CLK;
    diex.CLK <= CLK;
    exmem.CLK <= CLK;
    memre.CLK <= CLK;
    mRam.CLK <= CLK;
    mRom.CLK <= CLK;
    mReg.CLK <=CLK;
    mAlu.CLK <= CLK;

    mRom.ADR <= ip;

    lidi.OPIN <= mRom.ROUT(31 downto 24);
    lidi.AIN <= mRom.ROUT(23 downto 16);
    lidi.BIN <= mRom.ROUT(15 downto 8);
    lidi.CIN <= mRom.ROUT(7 downto 0);

    mReg.ADR_A <= lidi.BOUT(3 downto 0);

    diex.AIN <= lidi.AOUT;
    diex.OPIN <= lidi.OPOUT;

    exmem.AIN <= diex.AOUT;
    exmem.OPIN <= diex.OPOUT;
    exmem.BIN <= diex.BOUT;

    memre.AIN <= exmem.AOUT;
    memre.OPIN <= exmem.OPOUT;
    memre.BIN <= exmem.BOUT;

    mReg.ADR_W <= memre.AOUT(3 downto 0);
    mReg.DATA <= memre.BOUT;

    -- LC post memrem
    mReg.W <= '1' when (memre.OPOUT = X"06" or memre.OPOUT = X"05") else '0' ;
    --MUX post lidi
    diex.BIN <= mReg.QA when (lidi.OPOUT = X"05") else lidi.BOUT;

    toto : process(CLK)
    begin
        if(rising_edge(CLK)) then
            ip <= ip + '1';
        end if;
    end process;



end Behavioral;