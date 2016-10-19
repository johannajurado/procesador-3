
-- VHDL Instantiation Created from source file memoriaInstrucciones.vhd -- 18:35:32 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT memoriaInstrucciones
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_memoriaInstrucciones: memoriaInstrucciones PORT MAP(
		direccion => ,
		instruccion => ,
		reset => 
	);


