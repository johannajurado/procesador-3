----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:46 10/12/2016 
-- Design Name: 
-- Module Name:    procesadorfinal - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesadorfinal is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC
			  resultado_Procesador : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end procesadorfinal;

architecture Behavioral of procesadorfinal is

COMPONENT sumador
	PORT(
		entrada_sum1 : IN std_logic_vector(31 downto 0);
		entrada_sum2 : IN std_logic_vector(31 downto 0);          
		salida_sumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal sumadorToNPC,npcToPC:STD_LOGIC_VECTOR (31 downto 0);

begin

	Inst_sumador: sumador PORT MAP(
		entrada_sum1 =>x"00000001" ,
		entrada_sum2 =>npcToPC,
		salida_sumador =>sumadorToNPC 
	);

end Behavioral;



