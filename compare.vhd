library ieee;
use ieee.std_logic_1164.all;


-- comparador de bits

entity compare is
	 port (
		a, b: in std_logic_vector(3 downto 0);
		aeqb, agtb, altb: out std_logic);
end compare;

architecture logica of compare is

	signal i: std_logic_vector(3 downto 0);
	signal eq, gt: std_logic;
	
	begin
	
		-- o xnor confere se os bits sao iguais, se sim = 1
		i(3)<= a(3) xnor b(3);
		i(2)<= a(2) xnor b(2);
		i(1)<= a(1) xnor b(1);
		i(0)<= a(0) xnor b(0);

		
		-- se forem iguais 'eq' sera = 1
		eq<= i(0) and i(1) and i(2) and i(3);

		--confere se a > b
		gt <= (not b(3) and a(3)) or (i(3) and not b(2) and a(2)) or (i(3) and i(2) and not b(1) and a(1)) or (i(3) and i(2) and i(1) and not b(0) and a(0));
		aeqb <= eq;
		agtb <= gt;

		-- se a nao for > nem = a b, ele é <
		altb <= eq nor gt;
		
end logica;