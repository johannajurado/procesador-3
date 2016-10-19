----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:39 10/10/2016 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( entrada_suma1 : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_sum2 : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_ALU : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin
process(entrada_suma1, entrada_sum2, alu_op)
begin
 case (alu_op) is 
			when "000000" => -- add
				salida_ALU <= entrada_suma1 + entrada_sum2;
			when "010000" => -- addcc
				salida_ALU <= entrada_suma1 + entrada_sum2;
         when "001000" => -- addX
				salida_ALU <= entrada_suma1 + entrada_sum2;
         when "011000" => -- addXcc
				salida_ALU <= entrada_suma1 + entrada_sum2;
         when "000100" => -- sub
				salida_ALU <= entrada_suma1 - entrada_sum2;				
			when "010100" => -- subcc
				salida_ALU <= entrada_suma1 - entrada_sum2;
			when "001100" => -- subX
				salida_ALU <= entrada_suma1 - entrada_sum2;
         when "011100" => -- subXcc
				salida_ALU <= entrada_suma1 - entrada_sum2;
         when "000001" => -- and
				salida_ALU <= entrada_suma1 and entrada_sum2;
			when "000101" => -- andn
				salida_ALU <= entrada_suma1 and not (entrada_sum2);	
			when "010101" => --andNcc
				salida_ALU <= entrada_suma1 and entrada_sum2;
			when "010001" => --andcc
				salida_ALU <= entrada_suma1 and entrada_sum2;
         when "000010" => --or
				salida_ALU <= entrada_suma1 or entrada_sum2;
	      when "000110" => --orn
				salida_ALU <= entrada_suma1 or not (entrada_sum2);	
	      when "010010" => --orcc
				salida_ALU <= entrada_suma1 or entrada_sum2;				
			when "010110" => --orNcc
				salida_ALU <= entrada_suma1 or entrada_sum2;     
			when "000011" => -- xor
				salida_ALU <= entrada_suma1 xor entrada_sum2;
			when "000111" => -- xnor
				salida_ALU <= entrada_suma1 xnor entrada_sum2;
         when "010011" => -- xorcc
				salida_ALU <= entrada_suma1 xor entrada_sum2;				
				
			when others => --otras instrucciones
				salida_ALU <= (others=>'0');
		end case;
	end process; 

end Behavioral;
