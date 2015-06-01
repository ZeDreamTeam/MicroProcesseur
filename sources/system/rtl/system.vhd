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

entity system is

    port(
        CLK     :       in STD_LOGIC
    );

end system;

architecture Behavioral of system is
    component aleaManager port( CLK :   in  STD_LOGIC;
                                DROP:   in STD_LOGIC;
                                RIN :  in  STD_LOGIC_VECTOR(31 downto 0);
                                DAIN :  in  STD_LOGIC_VECTOR(7 downto 0);
                                EAIN :  in  STD_LOGIC_VECTOR(7 downto 0);
                                DOPIN :  in  STD_LOGIC_VECTOR(7 downto 0);
                                EOPIN :  in  STD_LOGIC_VECTOR(7 downto 0);
                                ROUT : out STD_LOGIC_VECTOR(31 downto 0);
                                EN :    out STD_LOGIC);
    end component;
    component PC port(  EN  :   in STD_LOGIC;
                        SEL :   in STD_LOGIC_VECTOR(1 downto 0);
                        CLK :   in STD_LOGIC;
                        IZ :    in STD_LOGIC;
                        ADR :   in STD_LOGIC_VECTOR(7 downto 0);
                        COUT:   out unsigned(7 downto 0);
                        DROP:   out STD_LOGIC
                        );
    end component;
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
                        A :         in  unsigned(7 downto 0) ;
                        B :         in  unsigned(7 downto 0) ;
                        Ctrl_Alu :  in STD_LOGIC_VECTOR(2 downto 0);
                        S :         out  STD_LOGIC_VECTOR(7 downto 0) ;
                        N :         out STD_LOGIC;
                        O :         out STD_LOGIC;
                        Z :         out STD_LOGIC;
                        C :         out STD_LOGIC);
  end component;

    component rom  port(    EN     :       in STD_LOGIC;
                            CLK     :       in STD_LOGIC;
                            ADR     :       in STD_LOGIC_VECTOR(7 downto 0);
                            RIN    :       in STD_LOGIC_VECTOR(31 downto 0);
                            ROUT    :       out STD_LOGIC_VECTOR(31 downto 0));
  end component;

    component ram port( CLK     :       in STD_LOGIC;
                        RST     :       in STD_LOGIC;
                        RW      :       in STD_LOGIC;
                        ADR     :       in STD_LOGIC_VECTOR(7 downto 0);
                        RIN     :       in STD_LOGIC_VECTOR(7 downto 0);
                        ROUT    :       out STD_LOGIC_VECTOR(7 downto 0));
  end component;
    type PCT is record
        EN  :  STD_LOGIC;
        SEL :  STD_LOGIC_VECTOR(1 downto 0);
        CLK :   STD_LOGIC;
        IZ :    STD_LOGIC;
        ADR :   STD_LOGIC_VECTOR(7 downto 0);
        COUT:   unsigned(7 downto 0);
        DROP:   STD_LOGIC;
    end record;
    type aleaManagerT is record 
        CLK :   STD_LOGIC;
        DROP:   STD_LOGIC;
        RIN :  STD_LOGIC_VECTOR(31 downto 0);
        DAIN :  STD_LOGIC_VECTOR(7 downto 0);
        EAIN :  STD_LOGIC_VECTOR(7 downto 0);
        DOPIN :  STD_LOGIC_VECTOR(7 downto 0);
        EOPIN :  STD_LOGIC_VECTOR(7 downto 0);
        ROUT : STD_LOGIC_VECTOR(31 downto 0);
        EN :    STD_LOGIC;
    end record;
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
    EN : STD_LOGIC;
    CLK : STD_LOGIC;
    ADR : STD_LOGIC_VECTOR(7 downto 0);
    RIN: STD_LOGIC_VECTOR(31 downto 0);
    ROUT: STD_LOGIC_VECTOR(31 downto 0);
  end record;

    type aluT is record
        CLK :       STD_LOGIC;
        A :         unsigned(7 downto 0) ;
        B :         unsigned(7 downto 0) ;
        Ctrl_Alu :  STD_LOGIC_VECTOR(2 downto 0);
        S :         STD_LOGIC_VECTOR(7 downto 0) ;
        N :         STD_LOGIC;
        O :         STD_LOGIC;
        Z :         STD_LOGIC;
        C :         STD_LOGIC;
  end record;
    signal mAleaM : aleaManagerT;
    signal mPC : PCT;
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
  lAleaManager : aleaManager port map(mAleaM.CLK,
                                        mAleaM.DROP,
                                        mAleaM.RIN,
                                        mAleaM.DAIN,
                                        mAleaM.EAIN,
                                        mAleaM.DOPIN,
                                        mAleaM.EOPIN,
                                        mAleaM.ROUT,
                                        mAleaM.EN);

  lPC : PC port map(mPC.EN,
                    mPC.SEL,
                    mPC.CLK,
                    mPC.IZ,
                    mPC.ADR,
                    mPC.COUT,
                    mPC.DROP);
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

lrom : rom port map(    mRom.EN, 
                        mRom.CLK, 
                        mRom.ADR, 
                        mRom.RIN,
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
    mAleaM.CLK <= CLK;
    mPC.CLK <= CLK;
    lidi.CLK <= CLK;
    diex.CLK <= CLK;
    exmem.CLK <= CLK;
    memre.CLK <= CLK;
    mRam.CLK <= CLK;
    mRom.CLK <= CLK;
    mReg.CLK <=CLK;
    mAlu.CLK <= CLK;

    --ALEA MANAGER MAP OUFOUF
    mPC.EN <= mAleaM.EN;
    mRom.EN <= mAleaM.EN;
    mAleaM.RIN <= mRom.ROUT;
    mAleaM.DAIN <= lidi.AOUT;
    mAleaM.EAIN <= diex.AOUT;
    mAleaM.DOPIN <= lidi.OPOUT;
    mAleaM.EOPIN <= diex.OPOUT;
    mAleaM.DROP <= mPC.DROP;

    --ROM MAP
    mRom.ADR <= std_logic_vector(mPC.COUT);
    mRom.RIN <= mRom.ROUT;

    --PC MAP
    mPC.IZ <= mAlu.Z;


    --

    lidi.OPIN <= mAleaM.ROUT(31 downto 24);
    lidi.AIN <= mAleaM.ROUT(23 downto 16);
    lidi.BIN <= mAleaM.ROUT(15 downto 8);
    lidi.CIN <= mAleaM.ROUT(7 downto 0);

    mReg.ADR_A <= lidi.BOUT(3 downto 0);
    mReg.ADR_B <= lidi.COUT(3 downto 0);


    diex.AIN <= lidi.AOUT;
    diex.OPIN <= lidi.OPOUT;
    diex.CIN <= mReg.QB;

    mAlu.A <= unsigned(diex.BOUT);
    mAlu.B <= unsigned(diex.COUT);

    exmem.AIN <= diex.AOUT;
    exmem.OPIN <= diex.OPOUT;

    
    mRam.RIN <= exmem.BOUT;


    memre.AIN <= exmem.AOUT;
    memre.OPIN <= exmem.OPOUT;

    
    mReg.ADR_W <= memre.AOUT(3 downto 0);
    mReg.DATA <= memre.BOUT;


    --MUX post ROM 
    mPC.ADR <= mRom.ROUT(23 downto 16) when ((mRom.ROUT(31 downto 24) = X"0A") or (mRom.ROUT(31 downto 24) = X"0B"));
    mPC.SEL <= B"01" when (mRom.ROUT(31 downto 24) = X"0A") else
        B"10" when (mRom.ROUT(31 downto 24) = X"0B" ) else
            B"00";



    --MUX post REG
    diex.BIN <= mReg.QA when (lidi.OPOUT = X"05" or lidi.OPOUT = X"01" or lidi.OPOUT = X"03" or lidi.OPOUT = X"02" or lidi.OPOUT = X"08") else lidi.BOUT;

    --LC pre ALU
    mAlu.Ctrl_Alu <= B"001" when (diex.OPOUT = X"01") else
        B"010" when (diex.OPOUT = X"03") else
            B"011" when (diex.OPOUT = X"02") else
                B"000";

    --MUX post ALU
    exmem.BIN <= mAlu.S when (diex.OPOUT = X"01" or diex.OPOUT = X"02" or diex.OPOUT = X"03") else diex.BOUT;
     
     
    --MUX pre RAM
    mRam.ADR <= exmem.AOUT when (exmem.OPOUT = X"08") else 
        exmem.BOUT;


    --LC  RAM
    mRam.RW <= '0' when (exmem.OPOUT = X"08") else
        '1';

    --MUX post RAM
    memre.BIN <= mRam.ROUT when (exmem.OPOUT = X"07") else
        exmem.BOUT;

    -- LC post memrem
    mReg.W <= '1' when (memre.OPOUT = X"06" or memre.OPOUT = X"05" or memre.OPOUT = X"01" or memre.OPOUT = X"03" or memre.OPOUT = X"02" or memre.OPOUT = X"07") else '0' ;
    





end Behavioral;