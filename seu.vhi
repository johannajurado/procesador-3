
-- VHDL Instantiation Created from source file seu.vhd -- 23:13:02 10/12/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT seu
	PORT(
		inmediato13bits : IN std_logic_vector(12 downto 0);          
		salidaInmediato : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_seu: seu PORT MAP(
		inmediato13bits => ,
		salidaInmediato => 
	);


