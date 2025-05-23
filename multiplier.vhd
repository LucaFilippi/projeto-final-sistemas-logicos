library ieee;
use ieee.std_logic_1164.all;
use work.full_adder_pkg.all;

--multiplicador de 2 bits
entity multiplier is

port(
	a, b: in std_logic_vector(1 downto 0);
	prod: out std_logic_vector(3 downto 0)
	);

end multiplier;

architecture logica of multiplier is

signal pp: std_logic_vector (3 downto 0);
signal cout: std_logic;

begin
	
		--multiplica todos os bits entre si
		pp(0) <= a(0) and b(0);
		pp(1) <= a(1) and b(0);
		pp(2) <= a(0) and b(1);
		pp(3) <= a(1) and b(1);
		
		--produtos entre os primeiros bits
		prod(0) <= pp(0);

		--soma dos produtos com os couts anteriores
		stage0: full_adder port map (pp(1), pp(2), '0', prod(1), cout);
		stage1: full_adder port map (pp(3), '0', cout, prod(2), prod(3));

end logica;