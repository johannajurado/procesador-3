----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:46 10/12/2016 
-- Design Name: 
-- Module Name:    procesador_finalaleja - arq_procesador 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesador_finalaleja is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           resultadoProcesador : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador_finalaleja;

architecture arq_procesador of procesador_finalaleja is

COMPONENT sumador
	PORT(
		entrada_sum1 : IN std_logic_vector(31 downto 0);
		entrada_sum2 : IN std_logic_vector(31 downto 0);          
		salida_sumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT nPC
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		actual : IN std_logic_vector(31 downto 0);          
		salida_nPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	
		COMPONENT memoriaInstrucciones
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT unidadControl
	PORT(
		op : IN STD_LOGIC_VECTOR(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida_UC : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
		COMPONENT registroArchivo_RF
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		reset : IN std_logic;
		dataWrite : IN std_logic_vector(31 downto 0);
		rd : IN std_logic_vector(4 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT muxx
	PORT(
		i : IN std_logic;
		dato_seu : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);          
		salida_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
  
  
	COMPONENT seu
	PORT(
		inmediato13bits : IN std_logic_vector(12 downto 0);          
		salidaInmediato : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	


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



	COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		carry : OUT std_logic
		);
	END COMPONENT;
	
		COMPONENT Alu
	PORT(
		entrada_suma1 : IN std_logic_vector(31 downto 0);
		entrada_sum2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);
		carry	: IN std_logic;	
		salida_ALU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal sumadorToNPC,npcToPC,pcToIM,imToURS,aluResult,rfToalup1,rfTomux,seuTomux,muxToalu: STD_LOGIC_VECTOR (31 downto 0);--creo senales de 32
signal alup_op1: STD_LOGIC_VECTOR (5 downto 0);--creo senales de 6
signal psr_alu: STD_LOGIC := '0';--creo senals de 1
signal psrmodifier_psr: STD_LOGIC_VECTOR(3 downto 0);--creo senals de 4

begin

	Inst_sumador: sumador PORT MAP(
		entrada_sum1 =>x"00000001" ,
		entrada_sum2 =>npcToPC,
		salida_sumador =>sumadorToNPC 
	);



	Inst_nPC: nPC PORT MAP(
		clk =>clk ,
		reset =>reset ,
		actual =>sumadorToNPC ,
		salida_nPC =>npcToPC
	);
	
	

	Inst_PC: nPC PORT MAP(
		clk =>clk ,
		reset =>reset ,
		actual =>npcToPC,
		salida_nPC =>pcToIM
	);

	

	Inst_memoriaInstrucciones: memoriaInstrucciones PORT MAP( --la memoria se divide entre la unidad de control y RF
		direccion =>pcToIM ,
		instruccion =>imToURS  , --se divide en 32 bits entre unidad de control,register file y unidad de extension de signo
		reset =>reset 
	);

Inst_unidadControl: unidadControl PORT MAP(
		op =>imToURS(31 downto 30) , ---indica que tipo de formato estoy utilizando
		op3 =>imToURS(24 downto 19)  ,
		salida_UC =>alup_op1 
	);
	
	Inst_registroArchivo_RF: registroArchivo_RF PORT MAP(
		rs1 =>imToURS(18 downto 14) ,
		rs2 =>imToURS(4 downto 0) ,
		rd => imToURS(29 downto 25),
		dataWrite=>aluResult ,
		reset => reset,
		crs1 =>rfToalup1 ,
		crs2 =>rfTomux 
		
	);
	
	
	Inst_muxx: muxx PORT MAP(
		i =>imToURS(13) ,
		dato_seu =>seuTomux,
		crs2 =>rfTomux ,
		salida_mux =>muxToalu
	);

Inst_seu: seu PORT MAP(
		inmediato13bits =>imToURS(12 downto 0) ,
		salidaInmediato =>seuTomux 
	);
	


	Inst_PSR_Modifier: PSR_Modifier PORT MAP(
		ALUOP =>alup_op1  ,
		ALU_Result =>aluResult,
		Crs1 =>rfToalup1 ,
		Crs2 =>muxToalu ,
		nzvc => psrmodifier_psr,
		reset =>reset
	);


	Inst_PSR: PSR PORT MAP(
		nzvc =>psrmodifier_psr ,
		reset =>reset ,
		clk => clk,
		carry =>psr_alu
	);

Inst_Alu: Alu PORT MAP(
		entrada_suma1 =>rfToalup1 ,
		entrada_sum2 =>muxToalu ,
		alu_op =>alup_op1 ,
		Carry => psr_alu,
		salida_ALU =>aluResult 
	);


resultadoProcesador<=aluResult;

end arq_procesador;

