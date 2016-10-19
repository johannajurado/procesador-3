----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:37 10/08/2016 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           actual_PC : in  STD_LOGIC_VECTOR (31 downto 0);
           salida_PC : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

begin
   process (clk,reset,actual_PC)
	begin
	if(rising_edge(clk))then
			if reset='1' then
			salida_PC<=x"00000000";
		else
		salida_PC <=actual_PC;		
		end if;
	end if;
end process;


end Behavioral;


