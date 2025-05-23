library ieee;
use ieee.std_logic_1164.all;

-- pacote com as entradas e saidas do comparador
package compare_pkg is
	component compare
		port (
			a, b: in std_logic_vector(3 downto 0);
			aeqb, agtb, altb: out std_logic);
	end component;
end compare_pkg;