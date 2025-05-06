library ieee;
use ieee.std_logic_1164.all;
use adder.all

entity subtrator is
	port(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		s: out std_logic_vector (3 downto 0);
		cout: out std_logic(3 downto 0));
end subtrator;

architecture logica of subtrator is
	signal inv: std_logic_vector (3 downto 0);
	signal cout_inv: std_logic_vector (2 downto 0);
	signal bf: std_logic_vector (3 downto 0);
	
	begin
		inv(0) <= not b(0);
		inv(1) <= not b(1);
		inv(2) <= not b(2);
		inv(3) <= not b(3);
		
		inversor0: port map half_adder ('1', inv(0), cout_inv(0), bf(0));
		inversor1: port map half_adder (inv(1), cout_inv(0), cout_inv(1), bf(1));
		inversor2: port map half_adder (inv(2), cout_inv(1), cout_inv(2), bf(2));
		inversor1: port map half_adder (inv(3), cout_inv(2), cout_inv(3), bf(3));
		
		somador0: port map full_adder (a(0), bf(0), cin, s(0), cout(0));
		somador1: port map full_adder (a(1), bf(1), cout(0), s(1), cout(1));
		somador2: port map full_adder (a(2), bf(2), cout(1), s(2), cout(2));
		somador3: port map full_adder (a(3), bf(3), cout(2), s(3), cout(3));
	end;