library ieee;
use ieee.std_logic_1164.all;
use work.full_adder_pkg.all;
use work.multiplier_pkg.all;
use work.compare_pkg.all;
use work.ula_pkg.all;

--chamda do componente ula para o funcionamento da placa
entity ula_board is
	port(
		sw: in std_logic_vector(10 downto 0);
		hex2: out std_logic_vector(0 to 6);
		hex0: out std_logic_vector(0 to 6);
		hex4: out std_logic_vector(0 to 6);
		hex6: out std_logic_vector(0 to 6);
		ledr: out std_logic_vector(0 to 5));
end ula_board;
		
architecture bhv of ula_board is
	signal a, b, resultado: std_logic_vector(3 downto 0);
	signal alu : std_logic_vector (2 downto 0);
	signal eq, gr, lt, o, cout: std_logic;
	
		begin
			--passada dos valores de entrada na placa para os sianis 
			a <= sw(10 downto 7);
			b <= sw(6 downto 3);
			alu <= sw(2 downto 0);
			
			--chamada do complemento com o funcionamento da placa
			board: ula port map (a, b, alu, resultado, eq, gr, lt, o);
			
		-- impressao da selecao do aluop	
		with alu select
		hex0 <=  "0000001" when "000",
				  "1001111" when "001",
				  "0010010" when "010",
				  "0000110" when "011",
				  "1001100" when "100",
				  "0100100" when "101",
				  "0100000" when "110",
				  "0001111" when "111",
				  "1111111" when others;
		
		--valor selecionado em b
		with b select
		hex2 <=   "0000001" when "0000",
				  "1001111" when "0001",
				  "0010010" when "0010",
				  "0000110" when "0011",
				  "1001100" when "0100",
				  "0100100" when "0101",
				  "0100000" when "0110",
				  "0001111" when "0111",
				  "0000000" when "1000",
				  "0001100" when "1001",
				  "0001000" when "1010",
				  "1100000" when "1011",
				  "0110001" when "1100",
				  "1000010" when "1101",
				  "0110000" when "1110",
				  "0111000" when "1111",
				  "1111111" when others;
		
		--valor selecionado em a
		with a select
		hex4 <=   "0000001" when "0000",
				  "1001111" when "0001",
				  "0010010" when "0010",
				  "0000110" when "0011",
				  "1001100" when "0100",
				  "0100100" when "0101",
				  "0100000" when "0110",
				  "0001111" when "0111",
				  "0000000" when "1000",
				  "0001100" when "1001",
				  "0001000" when "1010",
				  "1100000" when "1011",
				  "0110001" when "1100",
				  "1000010" when "1101",
				  "0110000" when "1110",
				  "0111000" when "1111",
				  "1111111" when others;		
		
		--impressao do resultado da operaçao selecionada
		with resultado select
		hex6 <=   "0000001" when "0000",
				  "1001111" when "0001",
				  "0010010" when "0010",
				  "0000110" when "0011",
				  "1001100" when "0100",
				  "0100100" when "0101",
				  "0100000" when "0110",
				  "0001111" when "0111",
				  "0000000" when "1000",
				  "0001100" when "1001",
				  "0001000" when "1010",
				  "1100000" when "1011",
				  "0110001" when "1100",
				  "1000010" when "1101",
				  "0110000" when "1110",
				  "0111000" when "1111",
				  "1111111" when others;		
				  
		--ascende quando ha cout
		ledr(0) <= cout;
		
		--ascende quando nao ha funçao selecionada
		with alu select
		ledr(1) <= '1' when "000",
					  '0' when others;
		
		--overflow
		ledr(2) <= o;
		
		--quando for igual, maior ou menor
		ledr(3) <= eq;
		ledr(4) <= gr;
		ledr(5) <= lt;
end bhv;
			