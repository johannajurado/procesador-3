
-- VHDL Instantiation Created from source file muxx.vhd -- 23:12:06 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT muxx
	PORT(
		i : IN std_logic;
		dato_seu : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);          
		salida_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_muxx: muxx PORT MAP(
		i => ,
		dato_seu => ,
		crs2 => ,
		salida_mux => 
	);


