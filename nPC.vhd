----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:37 10/08/2016 
-- Design Name: 
-- Module Name:    nPC - Behavioral 
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

entity nPC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           actual : in  STD_LOGIC_VECTOR (31 downto 0);
           salida_nPC : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture Behavioral of nPC is

begin
   process (clk,reset,actual)
	begin
	if(rising_edge(clk))then
			if reset='1' then
			salida_nPC<=x"00000000";
		else
		salida_nPC <=actual;		
		end if;
	end if;
end process;


end Behavioral;

