library ieee;
use ieee.std_logic_1164.all;
use work.full_adder_pkg.all;

--pacote com as entradas e saidas do multiplicador de bits

package multiplier_pkg is
component multiplier 
port(
	a, b: in std_logic_vector(1 downto 0);
	prod: out std_logic_vector(3 downto 0)
	);
	end component;
end multiplier_pkg;