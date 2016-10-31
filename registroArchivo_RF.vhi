
-- VHDL Instantiation Created from source file registroArchivo_RF.vhd -- 18:41:07 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT registroArchivo_RF
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		reset : IN std_logic;
		rd : IN std_logic_vector(4 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_registroArchivo_RF: registroArchivo_RF PORT MAP(
		rs1 => ,
		rs2 => ,
		reset => ,
		crs1 => ,
		crs2 => ,
		rd => 
	);


