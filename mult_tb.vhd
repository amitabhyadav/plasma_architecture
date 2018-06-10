--mult_func
--sum
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT mult
	generic(
		mult_type  : string := "DEFAULT"
	);
	port(
		clk       : in std_logic;
        reset_in  : in std_logic;
        a, b      : in std_logic_vector(31 downto 0);
        mult_func : in mult_function_type;
        c_mult    : out std_logic_vector(31 downto 0);
        pause_out : out std_logic
	);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL reset_in :  std_logic;
	SIGNAL a :  std_logic_vector(31 downto 0);
	SIGNAL b :  std_logic_vector(31 downto 0);
	SIGNAL mult_func :  std_function_type;
	SIGNAL pause_out :  std_logic;
	constant PERIOD : time := 20 ns;
	
BEGIN

	uut: mult PORT MAP(
		clk => clk,
		reset_in => reset_in,
		a => a,
		a => b,
		mult_func => mult_func,
		pause_out => pause_out
	);


	-- PROCESS TO CONTROL THE CLOCK
	clock : PROCESS
	BEGIN
	
		clk <= '1';
		WAIT FOR PERIOD/2;
		clk <= '0';
		WAIT FOR PERIOD/2;

	END PROCESS;


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
   
		--start <= '0';		
		reset_in <= '1';
		
		WAIT FOR 40 NS;
		
		--mcand <= "01101110010100001111001010000111";	-- 32 bit
		--mplier <= "10000000000000000000001001001001";
				
		WAIT FOR 40 NS;

		reset_in <= '0';		
	
		WAIT FOR 20 NS;

		mult_func <= '';
		
		WAIT FOR 500 NS;  	
		
		mcand <=  "00001101001111111111101101111001"; --"11110010110000000000010010000111";
		mplier <= "01111111111111110010110000011001"; --"10000000000000001101001111100111";


		WAIT FOR 500 NS;

		
		--WAIT FOR 20 NS;  

		--start <= '0';
		

		
		
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;