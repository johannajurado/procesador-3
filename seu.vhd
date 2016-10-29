----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:05:02 10/12/2016 
-- Design Name: 
-- Module Name:    seu - Behavioral 
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

entity seu is
    Port ( inmediato13bits : in  STD_LOGIC_VECTOR (12 downto 0);
           salidaInmediato : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture arq_seu of seu is

begin

process(inmediato13bits)
begin
if(inmediato13bits(12) = '1')then --verifica si el numero es negativo
			salidaInmediato(12 downto 0) <= inmediato13bits;
			salidaInmediato(31 downto 13) <= (others=>'1');--completa con unos por ser negativo
		else
			salidaInmediato(12 downto 0) <= inmediato13bits;
			salidaInmediato(31 downto 13) <= (others=>'0');--si es positivo completa con ceros
		end if;
end process; 

end arq_seu;
