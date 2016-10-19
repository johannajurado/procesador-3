--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:20:58 10/08/2016
-- Design Name:   
-- Module Name:   E:/electronica/proyectos y trabajos de la utp/sistemas digitalesIII/programas_xiling/procesador/procesador_aleja/procesador_aleja/nPC_test.vhd
-- Project Name:  procesador_aleja
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nPC
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY nPC_test IS
END nPC_test;
 
ARCHITECTURE behavior OF nPC_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nPC
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         actual : IN  std_logic_vector(31 downto 0);
         salida_nPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal actual : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida_nPC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nPC PORT MAP (
          clk => clk,
          reset => reset,
          actual => actual,
          salida_nPC => salida_nPC
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
    stim_proc: process
   begin		
		reset<='1';
      -- hold reset state for 100 ns.
      wait for 30 ns;
		reset<='0';
		actual <=  x"00000010"; 
		wait for 30 ns;
		actual <=  x"00000011";
		wait for 30 ns;
		actual <=  x"00000012";

      wait;
   end process;

END;
