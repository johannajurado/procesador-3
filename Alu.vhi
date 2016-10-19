
-- VHDL Instantiation Created from source file Alu.vhd -- 18:59:23 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Alu
	PORT(
		entrada_suma1 : IN std_logic_vector(31 downto 0);
		entrada_sum2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		salida_ALU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Alu: Alu PORT MAP(
		entrada_suma1 => ,
		entrada_sum2 => ,
		alu_op => ,
		salida_ALU => 
	);


