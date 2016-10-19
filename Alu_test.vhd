--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:34:16 10/10/2016
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Desktop/procesador_aleja/procesador_aleja/Alu_test.vhd
-- Project Name:  procesador_aleja
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu
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
 
ENTITY Alu_test IS
END Alu_test;
 
ARCHITECTURE behavior OF Alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         entrada_suma1 : IN  std_logic_vector(31 downto 0);
         entrada_sum2 : IN  std_logic_vector(31 downto 0);
         alu_op : IN  std_logic_vector(5 downto 0);
         salida_ALU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_suma1 : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada_sum2 : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida_ALU : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          entrada_suma1 => entrada_suma1,
          entrada_sum2 => entrada_sum2,
          alu_op => alu_op,
          salida_ALU => salida_ALU
        );



   -- Stimulus process
   stim_proc: process
   begin	
		entrada_suma1 <= x"00000004";
		entrada_sum2 <= x"00000002";
		alu_op <= "000000";
     



      wait;
   end process;

END;
