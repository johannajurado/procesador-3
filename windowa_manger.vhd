----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:17 10/29/2016 
-- Design Name: 
-- Module Name:    windows_manager - arq_windowsManager 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           cwp : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC;
			  O7 : out STD_LOGIC_VECTOR(5 downto 0));
end WindowsManager;

architecture Behavioral of WindowsManager is

begin
process(rs1,rs2,rd, cwp)
	begin
		--si es locales y salida
		if (rs1>="01000" and rs1<="10111") then
			nrs1<=conv_std_logic_vector(conv_integer(rs1)+(conv_integer(cwp)*16),6);
		end if;
		if (rs2>="01000" and rs2<="10111") then
			nrs2<=conv_std_logic_vector(conv_integer(rs2)+(conv_integer(cwp)*16),6);
		end if;
		if (rd>="01000" and rd<="10111") then
			nrd<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp)*16),6);
		end if;
		
		--si es entrada
		if (rs1>="11000" and rs1<="11111") then
			nrs1<=conv_std_logic_vector(conv_integer(rs1)-(conv_integer(cwp)*16),6);
		end if;
		if (rs2>="11000" and rs2<="11111") then
			nrs2<=conv_std_logic_vector(conv_integer(rs2)-(conv_integer(cwp)*16),6);
		end if;
		if (rd>="11000" and rd<="11111") then
			nrd<=conv_std_logic_vector(conv_integer(rd)-(conv_integer(cwp)*16),6);
		end if;
		
		--si es globales
		if (rs1>="00000" and rs1<="00111") then
			nrs1<='0'&rs1;
		end if;
		if (rs2>="00000" and rs2<="00111") then
			nrs2<='0'&rs2;
		end if;
		if (rd>="00000" and rd<="00111") then
			nrd<='0'&rd;
		end if;
end process;

--save: cwp<=cwp-1 } cwp<='0'
--restore: cwp<=cwp+1 } cwp<='1'
process(op,op3,cwp)
	begin
		--formato3
		if (op="10") then
			--save
			if (op3="111100")then
				ncwp<='0';
			end if;
			--restore
			if (op3="111101")then
				ncwp<='1';
			end if;
		end if;
		
		O7 <= conv_std_logic_vector(15+(conv_integer(cwp)*16),6);

				
end process;

end Behavioral;
