library ieee;
use ieee.std_logic_1164.all;
use work.ripple_pkg.all;
use work.multiplier_pkg.all;
use work.compare_pkg.all;

--ula que reune as funcoes do projeto
entity ula is
	port(
		a, b: in std_logic_vector (3 downto 0);
		aluop: in std_logic_vector (2 downto 0);
		result: out std_logic_vector (3 downto 0);
		equ, grt, lst, ovr, c: out std_logic
		);

end ula;

architecture logica of ula is

	signal sa, ss, rand, rou, nao, add, sub, mul, prod: std_logic_vector (3 downto 0);
	signal couta, couts, eqs, grs,lts, ovra, ovrs, cins, cina: std_logic;

	
	begin
		--inversor
		nao <= not b;
		
		---subtracao
		subtrator: ripple port map (a, nao, '1', couts, ss);
		
		--soma
		somador: ripple port map (a, b, '0', couta, sa);
		
		--multiplicador 
		multiplicador: multiplier port map (a(1 downto 0), b(1 downto 0), prod);
		
		--comparador
		comparador: compare port map (a, b, eqs, grs, lts);
		
		--resultados das operacoes para os sinais de chamada
		rand <= a and b;
		rou <= a or b;
		add <= sa;
		sub <= ss;
		mul <= prod;
		
		--overflow da soma e subtracao
		ovra <= ((not a(3) and (not b(3)) and sa(3)) or (a(3) and b(3) and (not sa(3))));
		ovrs <= ((not a(3) and (not b(3)) and ss(3)) or (a(3) and b(3) and (not ss(3))));
		
		--cout da soma e subtracao, para quando a funcao e selecioada
		with aluop select
			c <= 	 couta when "100",
					 couts when "101",
					 '0' when others;
		
		--overflow para quando a funcao e selecionada
		with aluop select
			ovr <=	 ovra when "100",
					 ovrs when "101",
					 '0' when others;

		--chamada do comparador de bits
		with aluop select
		      equ <= eqs when "111",
						 '0'  when others;
		
		with aluop select
		      grt <= grs when "111",
						 '0' when others;

		with aluop select
		      lst <= lts when "111",
						 '0' when others;
		
		--chamda das outras funcoes
		with aluop select
			result <= rand when "001",
						 rou when "010",
						 nao when "011",
						 add when "100",
						 sub when "101",
						 mul when "110",
						 "0000" when others;
	end;