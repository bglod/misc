library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.log2;

entity cb_example_top is
    generic (
        SPI_CLK_DIV      : positive := 2;
        GPOUT0_DEFAULT   : std_logic_vector(15 downto 0) := 16x"0387";
        GPOUT1_DEFAULT   : std_logic_vector(15 downto 0) := 16x"0387";
        DIQ1_MODE        : std_logic_vector(1 downto 0)  := (others => '0');
        DIQ1_DIR         : std_logic_vector(1 downto 0)  := (others => '0');
        DIQ2_MODE        : std_logic_vector(1 downto 0)  := (others => '0');
        DIQ2_DIR         : std_logic_vector(1 downto 0)  := (others => '0')
    );
    port (
        clock                  : in    std_logic;
        reset                  : in    std_logic;

        -- Avalon-MM Interface (see spec for details on pin names)
        address                : in    std_logic_vector(15 downto 0);
        rd                     : in    std_logic;
        readdata               : out   std_logic_vector(15 downto 0);
        readdatavalid          : out   std_logic;
        wr                     : in    std_logic;
        writedata              : in    std_logic_vector(15 downto 0);
        waitrequest            : out   std_logic;
        response               : out   std_logic_vector(1 downto 0) := "00";
        writeresponsevalid     : out   std_logic;

        -- EXPORT: Physical SPI Interface
        sen                    : out   std_logic;
        sclk                   : out   std_logic;
        sdio                   : out   std_logic;
        sdo                    : in    std_logic;

        -- EXPORT: Physical IQ Data Interface 1
        diq1_sig1              : in    std_logic                     := '1';
        diq1_sig2              : out   std_logic                     := '1';
        diq1_bus1              : in    std_logic_vector(11 downto 0) := (others => '1');
        diq1_bus2              : out   std_logic_vector(11 downto 0) := (others => '1');

        -- EXPORT: DIQ To FPGA Fabric
        app1_sig1              : in    std_logic                     := '1';
        app1_sig2              : out   std_logic                     := '1';
        app1_bus1              : in    std_logic_vector(11 downto 0) := (others => '1');
        app1_bus2              : out   std_logic_vector(11 downto 0) := (others => '1');

        -- EXPORT: Physical IQ Data Interface 2
        diq2_sig1              : in    std_logic                     := '1';
        diq2_sig2              : out   std_logic                     := '1';
        diq2_bus1              : in    std_logic_vector(11 downto 0) := (others => '1');
        diq2_bus2              : out   std_logic_vector(11 downto 0) := (others => '1');

        -- EXPORT: DIQ To FPGA Fabric
        app2_sig1              : in    std_logic                     := '1';
        app2_sig2              : out   std_logic                     := '1';
        app2_bus1              : in    std_logic_vector(11 downto 0) := (others => '1');
        app2_bus2              : out   std_logic_vector(11 downto 0) := (others => '1');

        -- EXPORT: GPIO
        -- QSys doesn't like arrays
        gp_out0                : out   std_logic_vector(15 downto 0);
        gp_out1                : out   std_logic_vector(15 downto 0);
        gp_in0                 : in    std_logic_vector(15 downto 0);
        gp_in1                 : in    std_logic_vector(15 downto 0)
    );
end entity;

architecture arch of cb_example_top is

begin

end architecture;
