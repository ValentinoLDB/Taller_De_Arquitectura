--Usamos el paquete de la Práctica 8
use work.Utils.all; 

-- La entidad del Testbench está vacía
entity Test_Multiplicador is
end entity Test_Multiplicador;

architecture Driver of Test_Multiplicador is

--DECLARACIÓN DE COMPONENTES

    component Multiplicador is
        port (
            A    : in Bit_Vector(3 downto 0);
            B    : in Bit_Vector(3 downto 0);
            STB  : in Bit;
            CLK  : in Bit;
            Result: out Bit_Vector(7 downto 0);
            Done : out Bit
        );
    end component;

    --DECLARACIÓN DE SEÑALES
    
    -- Señales para conectar al Multiplicador
    signal s_A     : Bit_Vector(3 downto 0);
    signal s_B     : Bit_Vector(3 downto 0);
    signal s_STB   : Bit;
    signal s_CLK   : Bit;
    signal s_Result: Bit_Vector(7 downto 0);
    signal s_Done  : Bit;
    
    -- Constantes para la prueba(03530/2->3530)
    constant VALOR_A : Natural := 3; 
    constant VALOR_B : Natural := 5; 

    -- Constante para el reloj (XX MHz)
    -- 35*2=70MHz => 14ns aprox
    constant CLK_PERIOD : time := 14 ns;

begin

    -- INSTANCIACIÓN DE COMPONENTES

    -- Instancia 1: El Multiplicador
    UUT: Multiplicador port map (
        A      => s_A,
        B      => s_B,
        STB    => s_STB,
        CLK    => s_CLK,
        Result => s_Result,
        Done   => s_Done
    );

    -- Instancia 2: Generador de Reloj (usando el procedure de la P8)
    -- Genera un reloj en la señal s_CLK con semi-períodos iguales.
    Reloj: Clock(s_CLK, CLK_PERIOD / 2, CLK_PERIOD / 2);

    --PROCESO DE ESTÍMULO
    
    Stimulus: process
    begin
        s_STB <= '0';
        s_A   <= (others => '0');
        s_B   <= (others => '0');
        
        wait for CLK_PERIOD * 2;

        s_A <= Convert(VALOR_A, 4);
        s_B <= Convert(VALOR_B, 4);

        s_STB <= '1';
        wait for CLK_PERIOD; 
        s_STB <= '0';
        
        wait until s_Done = '1';
        
        wait for CLK_PERIOD * 3;

        wait;
        
    end process Stimulus;

end architecture Driver;