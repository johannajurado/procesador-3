--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:05:10 10/10/2016
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Desktop/procesador_aleja/procesador_aleja/registroArchivo_test.vhd
-- Project Name:  procesador_aleja
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registroArchivo_RF
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
 
ENTITY registroArchivo_test IS
END registroArchivo_test;
 
ARCHITECTURE behavior OF registroArchivo_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registroArchivo_RF
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         reset : IN  std_logic;
         dataWrite : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0);
         rd : IN  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
	signal dataWrite : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal rd : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registroArchivo_RF PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
			 dataWrite => dataWrite,
          reset => reset,
          crs1 => crs1,
          crs2 => crs2,
          rd => rd
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
			reset <='0';
			rs1 <= "10000";
			rs2 <= "10001";
			rd <= "10010";
			dataWrite  <= "00000000000000000000000000010011";
			
	
      -- insert stimulus here 

      wait;
   end process;

END;
