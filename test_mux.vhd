--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:57:02 10/12/2016
-- Design Name:   
-- Module Name:   C:/Users/Administrador/Desktop/procesador 2 aleja/procesador_aleja/test_mux.vhd
-- Project Name:  procesador_aleja
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muxx
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
 
ENTITY test_mux IS
END test_mux;
 
ARCHITECTURE behavior OF test_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxx
    PORT(
	       i : IN  std_logic;
         dato_seu : IN  std_logic_vector(31 downto 0);
         salida_mux : IN  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal i : std_logic := '0';
   signal dato_seu : std_logic_vector(31 downto 0) := (others => '0');
   signal salida_mux : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxx PORT MAP (
	       i => i,
          dato_seu => dato_seu,
          salida_mux => salida_mux,
          crs2 => crs2
        );


-- Stimulus process
   stim_proc: process
   begin	
		i <='1';
		dato_seu <= x"00000004";
		crs2 	<= x"00000010";    
      wait;
   end process;


END;
