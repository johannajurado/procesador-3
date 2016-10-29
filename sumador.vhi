
-- VHDL Instantiation Created from source file sumador.vhd -- 18:15:32 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT sumador
	PORT(
		entrada_sum1 : IN std_logic_vector(31 downto 0);
		entrada_sum2 : IN std_logic_vector(31 downto 0);          
		salida_sumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_sumador: sumador PORT MAP(
		entrada_sum1 => ,
		entrada_sum2 => ,
		salida_sumador => 
	);


