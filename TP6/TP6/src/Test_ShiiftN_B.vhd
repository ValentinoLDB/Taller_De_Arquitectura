entity Test_ShiftN_B is
end entity Test_ShiftN_B;

architecture Driver_B of Test_ShiftN_B is

    -- 1. Definimos el período a probar.
    constant CLK_PERIOD : time := 6 ns; -- <--- ¡MODIFICAR ESTE VALOR!
    
    -- 2. Declaramos el componente que vamos a probar
    component ShiftN
        port (
            CLK: in Bit; 
            CLR: in Bit; 
            LD: in Bit;
            SH: in Bit; 
            DIR: in Bit;
            D: in Bit_Vector; 
            Q: out Bit_Vector
        );
    end component;
    
    -- 3. Señales para conectar al componente
    signal CLK, CLR, LD, SH, DIR: Bit := '0';
    -- Usamos los mismos anchos que en el testbench de la Parte A
    signal D_in: Bit_Vector(1 to 4);
    signal Q_out: Bit_Vector(8 downto 1);
    
begin

    -- 4. Instanciamos el Componente (UUT = Unit Under Test)
    UUT: ShiftN port map (
        CLK => CLK, 
        CLR => CLR, 
        LD  => LD, 
        SH  => SH, 
        DIR => DIR, 
        D   => D_in, 
        Q   => Q_out
    );

    -- 5. Generador de Reloj
    -- Este proceso genera un reloj con el período que definimos
    Clock_Gen: process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process Clock_Gen;
    
    -- 6. Proceso de Estímulo
    -- Aquí definimos la secuencia de prueba
    Stimulus: process
    begin
        -- 1. Resetear el registro
        CLR <= '1';
        wait for 5 ns; -- Espera un tiempo
        CLR <= '0';
        wait for CLK_PERIOD; -- Espera un ciclo de reloj para estabilizar

        -- 2. Cargar un valor inicial
        D_in <= "0001";
        LD <= '1';
        wait for CLK_PERIOD; -- Espera al flanco de subida
        LD <= '0';           -- Desactiva la carga
        
        -- 3. Habilitar el shift a la izquierda
        SH <= '1';
        DIR <= '1';
        
        -- Espera 10 ciclos de reloj para ver el desplazamiento
        wait for CLK_PERIOD * 10; 

        wait; -- Fin de la simulación
    end process Stimulus;

end architecture Driver_B;