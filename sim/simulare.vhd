library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity masina_spalat_tb is
end masina_spalat_tb;

architecture Behavioral of masina_spalat_tb is

    component main
        port (
            CLOCK : in STD_LOGIC;
            RESET : in STD_LOGIC;
            START : in STD_LOGIC;
            CONFIRM : in STD_LOGIC;
            OPTIUNE_MOD : in STD_LOGIC;
            ADRESA_MOD_AUTO : in STD_LOGIC_VECTOR(2 downto 0);
            ADRESA_CLATIRE : in STD_LOGIC;
            ADRESA_PRESPALARE : in STD_LOGIC;
            ADRESA_TEMPERATURA : in STD_LOGIC_VECTOR(1 downto 0);
            ADRESA_VITEZA : in STD_LOGIC_VECTOR(1 downto 0);
            LED_ON_OFF : out STD_LOGIC;
            LED_DOOR : out STD_LOGIC;
            CATOZI : out STD_LOGIC_VECTOR(6 downto 0);
            ANOZI : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Semnale de test
    signal CLOCK              : STD_LOGIC := '0';
    signal RESET              : STD_LOGIC := '0';
    signal START              : STD_LOGIC := '0';
    signal CONFIRM            : STD_LOGIC := '0';
    signal OPTIUNE_MOD        : STD_LOGIC := '0';
    signal ADRESA_MOD_AUTO    : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal ADRESA_CLATIRE     : STD_LOGIC := '0';
    signal ADRESA_PRESPALARE  : STD_LOGIC := '0';
    signal ADRESA_TEMPERATURA : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal ADRESA_VITEZA      : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal LED_ON_OFF         : STD_LOGIC;
    signal LED_DOOR           : STD_LOGIC;
    signal CATOZI             : STD_LOGIC_VECTOR(6 downto 0);
    signal ANOZI              : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instanțierea mașinii de spălat
    UUT: main
        port map (
            CLOCK              => CLOCK,
            RESET              => RESET,
            START              => START,
            CONFIRM            => CONFIRM,
            OPTIUNE_MOD        => OPTIUNE_MOD,
            ADRESA_MOD_AUTO    => ADRESA_MOD_AUTO,
            ADRESA_CLATIRE     => ADRESA_CLATIRE,
            ADRESA_PRESPALARE  => ADRESA_PRESPALARE,
            ADRESA_TEMPERATURA => ADRESA_TEMPERATURA,
            ADRESA_VITEZA      => ADRESA_VITEZA,
            LED_ON_OFF         => LED_ON_OFF,
            LED_DOOR           => LED_DOOR,
            CATOZI             => CATOZI,
            ANOZI              => ANOZI
        );

    -- Clock 50 MHz
    clk_process : process
    begin
        while true loop
            CLOCK <= '0';
            wait for 10 ns;
            CLOCK <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimuli
    stim_proc: process
    begin
        -- Reset inițial
        RESET <= '1';
        wait for 50 ns;
        RESET <= '0';

        -- Selectăm mod automat + Cămăși
        OPTIUNE_MOD <= '0';
        ADRESA_MOD_AUTO <= "001";  -- Cămăși = 45 min

        -- Pornim
        START <= '1';
        wait for 100 ns;

        -- Confirmăm
        CONFIRM <= '1';
        wait for 100 ns;
        CONFIRM <= '0';

        -- Lăsăm sistemul să ruleze
        wait for 3 ms;

        -- Simulare stop
        START <= '0';
        wait;
    end process;

end Behavioral;