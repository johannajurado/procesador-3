
-- VHDL Instantiation Created from source file PSR_Modifier.vhd -- 12:48:58 10/29/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSR_Modifier
	PORT(
		ALUOP : IN std_logic_vector(5 downto 0);
		ALU_Result : IN std_logic_vector(31 downto 0);
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_PSR_Modifier: PSR_Modifier PORT MAP(
		ALUOP => ,
		ALU_Result => ,
		Crs1 => ,
		Crs2 => ,
		nzvc => ,
		reset => 
	);


