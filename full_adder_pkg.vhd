library ieee;
use ieee.std_logic_1164.all;

--pacote com as entradas e saidas do somador de bits
package full_adder_pkg is
    component full_adder
        port (
            a   : in  std_logic;
            b   : in  std_logic;
            cin : in  std_logic;
            sum : out std_logic;
            cout: out std_logic
        );
    end component;
end package full_adder_pkg;
