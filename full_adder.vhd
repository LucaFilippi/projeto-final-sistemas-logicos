library ieee;
use ieee.std_logic_1164.all;

--somador de bits
entity full_adder is
    port(
        a   : in  std_logic;
        b   : in  std_logic;
        cin : in  std_logic;
        sum : out std_logic;
        cout: out std_logic
    );
end entity full_adder;

architecture behavioral of full_adder is
begin

	--soma a, b e cin
	sum  <= a xor b xor cin;
	
	--cout da soma
	cout <= (a and b) or (a and cin) or (b and cin);
end architecture behavioral;