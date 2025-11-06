entity Multiplicador is
    port (
        -- Entradas
        A: in Bit_Vector(3 downto 0); 		-- Multiplicador (4 bits)
        B: in Bit_Vector(3 downto 0); 		-- Multiplicando (4 bits)
        STB: in Bit;                    	-- Señal de inicio (Strobe)
        CLK: in Bit;                    	-- Reloj principal
        
        -- Salidas
        Result: out Bit_Vector(7 downto 0); -- Resultado (8 bits)
        Done: out Bit                      	-- '1' al finalizar
    );
end entity Multiplicador;


architecture Estructural of Multiplicador is
  
    --DECLARACIÓN DE COMPONENTES
   
    -- Componente de la Práctica 7
    component Controller is
        port (
            STB, CLK, LSB, Stop: in Bit;
            Init, Shift, Add, Done: out Bit
        );
    end component;

    -- Componente de la Práctica 6
    component ShiftN is
        port (
            CLK, CLR, LD, SH, DIR: in Bit;
            D: in Bit_Vector;
            Q: out Bit_Vector
        );
    end component;

    -- Componente de la Práctica 5
    component Adder8 is
        port (
            A, B: in Bit_Vector(7 downto 0);
            Cin: in Bit;
            Cout: out Bit;
            Sum: out Bit_Vector(7 downto 0)
        );
    end component;

    
    --DECLARACIÓN DE SEÑALES INTERNAS (Cables)
    
    -- Señales de control
    signal s_Init  : Bit;
    signal s_Shift : Bit;
    signal s_Add   : Bit;
    
    -- Señales de estado
    signal s_LSB   : Bit;
    signal s_Stop  : Bit;
    
    -- Buses de datos (salidas de registros)
    signal s_Q_SRA : Bit_Vector(7 downto 0); -- Salida 8 bits Registro A
    signal s_Q_SRB : Bit_Vector(7 downto 0); -- Salida 8 bits Registro B
    signal s_Q_ACC : Bit_Vector(7 downto 0); -- Salida 8 bits Acumulador
    
    -- Bus de salida del sumador
    signal s_Sum_Adder  : Bit_Vector(7 downto 0);
    signal s_Cout_Adder : Bit; -- No se usa, pero debe conectarse

begin
    
    --INSTANCIACIÓN DE COMPONENTES (Conexiones)
	
    -- Instancia 1: FSM Controller (P7)
    FSM_Controller: Controller port map (
        STB => STB,
        CLK => CLK,
        LSB => s_LSB,   -- Feedback desde SRA(0)
        Stop => s_Stop,  -- Feedback desde SRA (NOR 8 bits)
        Init => s_Init,
        Shift => s_Shift,
        Add => s_Add,
        Done => Done
    );

    -- Instancia 2: Registro A (SRA)
    -- Se usa un ShiftN (P6) de 8 bits.
    Reg_SRA: ShiftN port map (
        CLK => CLK,
        CLR => '0',         -- Clear asíncrono no se usa
        LD => s_Init,      -- Carga síncrona habilitada por 'Init'
        SH => s_Shift,     -- Shift síncrono habilitado por 'Shift'
        DIR => '0',         -- '0' = Shift a la DERECHA
        D => A,           -- Carga el puerto A (4 bits) en Q(3 downto 0)
        Q => s_Q_SRA      -- Salida de 8 bits
    );

    -- Instancia 3: Registro B (SRB)
    -- Se usa un ShiftN (P6) de 8 bits.
    Reg_SRB: ShiftN port map (
        CLK => CLK,
        CLR => '0',
        LD => s_Init,
        SH => s_Shift,
        DIR => '1',         -- '1' = Shift a la IZQUIERDA
        D => B,           -- Carga el puerto B (4 bits) en Q(3 downto 0)
        Q => s_Q_SRB
    );

    -- Instancia 4: Acumulador (ACC)
    -- Se usa un ShiftN (P6) como registro de 8 bits con carga y clear.
    Reg_ACC: ShiftN port map (
        CLK => CLK,
        CLR => s_Init,      -- Clear asíncrono se activa con 'Init'
        LD => s_Add,       -- Carga síncrona se activa con 'Add'
        SH => '0',         -- Se deshabilita el Shift
        DIR => '0',         -- No importa (SH=0)
        D => s_Sum_Adder, -- La entrada de datos es la salida del sumador
        Q => s_Q_ACC
    );

    -- Instancia 5: Sumador (Adder)
    -- Componente Adder8 (P5)
    Adder_Inst: Adder8 port map (
        A => s_Q_SRB,     -- Puerto A del sumador <= Salida de SRB
        B => s_Q_ACC,     -- Puerto B del sumador <= Salida de ACC
        Cin  => '0',         -- Sin carry de entrada
        Cout => s_Cout_Adder,
        Sum  => s_Sum_Adder  -- Salida del sumador
    );

    --LÓGICA CONCURRENTE

    -- La entrada LSB del FSM es el bit 0 de la salida de SRA
    s_LSB <= s_Q_SRA(0); 

    -- La entrada Stop del FSM es un NOR de 8 entradas (todos los bits de SRA)
    s_Stop <= not (s_Q_SRA(7) or s_Q_SRA(6) or s_Q_SRA(5) or s_Q_SRA(4) or
                   s_Q_SRA(3) or s_Q_SRA(2) or s_Q_SRA(1) or s_Q_SRA(0));

    -- La salida final del sistema es el contenido del Acumulador
    Result <= s_Q_ACC;

end architecture Estructural;