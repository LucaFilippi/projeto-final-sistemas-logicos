library ieee;
use ieee.std_logic_1164.all;
---chamada pacotes!!!!!!!!!!!!

entity ula is
	port(
		a, b: in std_logic_vector (3 downto 0);
		aluop: in std_logic_vector (2 downto 0);
		result: out std_logic_vector (3 downto 0));

end ula;

architecture logica of ula is
	signal inv: std_logic_vector (3 downto 0);
	signal cout_inv: std_logic_vector (2 downto 0);
	signal bf: std_logic_vector (3 downto 0);
	signal s: std_logic_vector (3 downto 0);
	signal rand: 
	
	begin
		nao(0) <= not b(0);
		nao(1) <= not b(1);
		nao(2) <= not b(2);
		nao(3) <= not b(3);
		
		inversor0: port map half_adder ('1', nao(0), cout_inv(0), bf(0));
		inversor1: port map half_adder (nao(1), cout_inv(0), cout_inv(1), bf(1));
		inversor2: port map half_adder (nao(2), cout_inv(1), cout_inv(2), bf(2));
		inversor1: port map half_adder (nao(3), cout_inv(2), cout_inv(3), bf(3));
		
		somador0: port map full_adder (a(0), bf(0), cin, s(0), cout(0));
		somador1: port map full_adder (a(1), bf(1), cout(0), s(1), cout(1));
		somador2: port map full_adder (a(2), bf(2), cout(1), s(2), cout(2));
		somador3: port map full_adder (a(3), bf(3), cout(2), s(3), cout(3));
		
		rand <= a and b;
		rou <= a or b;
		
		with aluop select
			result <= nop when "000";
			result <= rand when "001";
			result <= rou when "010";
			result <= nao when "011";
			result <= add when "100";
			result <= sub when "101";
			result <= mul when "110";
			result <= comp when "111";
			
			

		
	end;