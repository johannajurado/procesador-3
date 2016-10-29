--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:23:11 10/10/2016
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Desktop/procesador_aleja/procesador_aleja/unidadControl_test.vhd
-- Project Name:  procesador_aleja
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: unidadControl
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
 
ENTITY unidadControl_test IS
END unidadControl_test;
 
ARCHITECTURE behavior OF unidadControl_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unidadControl
    PORT(
         op : IN  std_logic;
         op3 : IN  std_logic_vector(5 downto 0);
         salida_UC : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic := '0';
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida_UC : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unidadControl PORT MAP (
          op => op,
          op3 => op3,
          salida_UC => salida_UC
        );

 

   -- Stimulus process
 stim_proc: process
   begin		
		op <= "10";
		op3<="000010";

      wait;
   end process;

END;
