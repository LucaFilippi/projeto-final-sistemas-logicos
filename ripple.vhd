library ieee;
use ieee.std_logic_1164.all;

--riple carry, somador de 4 bits
entity ripple is

port(
	
	a, b: in std_logic_vector(3 downto 0);
	cin: in std_logic;
	coutf: out std_logic;
	soma: out std_logic_vector(3 downto 0));
	
end ripple;

architecture logica of ripple is
	signal cout: std_logic_vector (3 downto 1);
	
begin
	
	--soma os bits com a cin
	soma(0) <= cin xor a(0) xor b(0);
	
	--verifica o cout da soma
	cout(1) <= (a(0) and b(0)) or (cin and a(0)) or (cin and b(0));
	
	soma(1) <= cout(1) xor a(1) xor b(1);
	cout(2) <= (a(1) and b(1)) or (cout(1) and a(1)) or (cout(1) and b(1));
	
	soma(2) <= cout(2) xor a(2) xor b(2);
	cout(3) <= (a(2) and b(2)) or (cout(2) and a(2)) or (cout(2) and b(2));
	
	soma(3) <= cout(3) xor a(3) xor b(3);
	coutf <= (a(3) and b(3)) or (cout(3) and a(3)) or (cout(3) and b(3));
	
end;
