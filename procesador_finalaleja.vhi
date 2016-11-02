
-- VHDL Instantiation Created from source file procesador_finalaleja.vhd -- 13:05:42 10/29/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT procesador_finalaleja
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;          
		resultadoProcesador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_procesador_finalaleja: procesador_finalaleja PORT MAP(
		clk => ,
		reset => ,
		resultadoProcesador => 
	);


