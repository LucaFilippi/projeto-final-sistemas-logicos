library ieee;
use ieee.std_logic_1164.all;
use work.ripple_pkg.all;
use work.multiplier_pkg.all;
use work.compare_pkg.all;

--pacote com as entradas e saidas da ula
package ula_pkg is
component ula
	port(
		a, b: in std_logic_vector (3 downto 0);
		aluop: in std_logic_vector (2 downto 0);
		result: out std_logic_vector (3 downto 0);
		equ, grt, lst, ovr: out std_logic
		);
	end component;
end ula_pkg;