--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:09:36 10/18/2016
-- Design Name:   
-- Module Name:   D:/Desktop/procesador 2 final alejandra/procesador 2 aleja/procesador_aleja/test_psr.vhd
-- Project Name:  procesador_aleja
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY PSR_tb IS
END PSR_tb;
 
ARCHITECTURE behavior OF PSR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         clk : IN  std_logic;
         ncwp : IN  std_logic_vector(1 downto 0);
         reset : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         carry : OUT  std_logic;
         icc : OUT  std_logic_vector(3 downto 0);
         cwp : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ncwp : std_logic_vector(1 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal carry : std_logic;
   signal icc : std_logic_vector(3 downto 0);
   signal cwp : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clk => clk,
          ncwp => ncwp,
          reset => reset,
          nzvc => nzvc,
          carry => carry,
          icc => icc,
          cwp => cwp
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
		nzvc<="0010";
		wait for 50 ns;
		reset<='0';
		nzvc<="1010";
		wait for 50 ns;
		nzvc<="1110";
		wait for 50 ns;
		nzvc<="0101";
      wait;
   end process;

END;
