entity Test_DFFB is end;

architecture Driver of Test_DFFB is 
	component DFF
	   port (Preset, Clear, Clock, Data: in Bit; Q, Qbar: out Bit);
	end component;
	signal Preset, Clear: Bit := '1';
	signal Clock, Data, Q, QBar: Bit;
begin
  UUT: DFF port map (Preset, Clear, Clock, Data, Q, Qbar);	
  Stimulus: Process
	Begin
	--minimo periodo de clock
	--Data <= '1'; wait for 10 ns;
	--Clock <= '0';
	--Clock <= '1', '0' after 0.99 ns; wait for 10 ns;	--0.99 rompe todo, 1 anda bien
	
	-- minimo ancho de pulso de preset y de clear

	-- Probar preset
	--Data <= '0';           -- dato cualquiera
	--wait for 5 ns;
	
	--Preset <= '0';         -- activo preset
	--wait for 0.0001 ns;         -- ancho del pulso de X ns --0.0001 rompe todo, en 0.001 sigue andando bien
	--Preset <= '1';         -- desactivo preset
	--wait for 5 ns;         -- espero para observar
	
	-- Probar clear
	--Data <= '1';           -- dato cualquiera
	--wait for 5 ns;
	
	--Clear <= '0';          -- activo clear
	--wait for 0.0001 ns;         -- ancho del pulso de X ns 1ns rompe todo
	--Clear <= '1';          -- desactivo clear
	--wait for 5 ns;         -- espero para observar

	
	-- minimo tiempo de 'setup' y de 'hold' de datos		 
		Clock <= '0';
		Clear <= '1'; wait for 5 ns;
		Clear <= '0'; wait for 1 ns; 
		Clear <= '1'; wait for 4 ns;	
	
		Data <= '1'; wait for 1 ns;					 -- para obtener el de setup ir variando este y dejar los otros 2 fijos
		Clock <= '1'; wait for 1 ns;
		wait for 0.000000000000000000000000000000001 ns;							-- para obtenere el de hold ir variando este y dejar los otros 2 fijos
		Data <= '0';

		Wait;
	end process Stimulus;
end;