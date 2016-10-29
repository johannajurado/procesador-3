
-- VHDL Instantiation Created from source file unidadControl.vhd -- 18:10:51 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT unidadControl
	PORT(
		op : IN std_logic;
		op3 : IN std_logic_vector(5 downto 0);          
		salida_UC : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_unidadControl: unidadControl PORT MAP(
		op => ,
		op3 => ,
		salida_UC => 
	);


