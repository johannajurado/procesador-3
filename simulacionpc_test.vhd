--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:17:49 10/08/2016
-- Design Name:   
-- Module Name:   E:/electronica/proyectos y trabajos de la utp/sistemas digitalesIII/programas_xiling/procesador/procesador_aleja/procesador_aleja/simulacionpc_test.vhd
-- Project Name:  procesador_aleja
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY simulacionpc_test IS
END simulacionpc_test;
 
ARCHITECTURE behavior OF simulacionpc_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         actual_PC : IN  std_logic_vector(31 downto 0);
         salida_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal actual_PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida_PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          clk => clk,
          reset => reset,
          actual_PC => actual_PC,
          salida_PC => salida_PC
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
		actual_PC <=  x"00000010"; 
		wait for 30 ns;
		actual_PC <=  x"00000011";
		wait for 30 ns;
		actual_PC <=  x"00000012";

      wait;
   end process;

END;
