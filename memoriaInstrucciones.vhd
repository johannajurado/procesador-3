----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:32:24 10/10/2016 
-- Design Name: 
-- Module Name:    memoriaInstrucciones - Behavioral 
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
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoriaInstrucciones is
    Port ( direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           instruccion : out  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC );
end memoriaInstrucciones;

architecture Behavioral of memoriaInstrucciones is

type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
	
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
	
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
		end loop;
	return temp_mem;
	end function;
	signal instructions : rom_type := InitRomFromFile("resta.txt");


begin
	process(reset,direccion, instructions)
	begin		
			if(reset = '1')then
				instruccion <= (others=>'0');
			else
				instruccion <= instructions(conv_integer(direccion(5 downto 0)));
			end if;
		
	end process;
	
end Behavioral;

