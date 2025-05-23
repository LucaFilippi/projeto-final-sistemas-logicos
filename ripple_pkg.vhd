library ieee;
use ieee.std_logic_1164.all;

--pacote com as entradas e saidas do ripple carry, somador de 4 bits
package ripple_pkg is
component ripple
	port(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		coutf: out std_logic;
		soma: out std_logic_vector(3 downto 0));
	end component;
end ripple_pkg;