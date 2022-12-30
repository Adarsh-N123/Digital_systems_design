library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity modul_10 is

    port(CLK : in std_logic;
	      RST : inout std_logic;
			Q : inout std_logic_vector(3 downto 0));
			
end entity;

architecture STRUCTURE of modul_10 is

  signal S : std_logic_vector(1 downto 0);
  signal QN : std_logic_vector(3 downto 0);
  signal RST_1, RST_2 : std_logic;
--  signal CLK_D :std_logic;
  
begin

U4 : or_2 port map (Q(1), Q(2), S(0));
U5 : and_2 port map (Q(3), S(0), S(1));
U6 : not_2 port map (S(1), RST_1);

U7 : and_2 port map (RST, RST_1, RST_2);

--U8 : clkdiv port map (CLK, RST, CLK_D);

U0 : d_flipflop port map (QN(0), CLK, RST_2, '1', Q(0), QN(0));
U1 : d_flipflop port map (QN(1), QN(0), RST_2, '1', Q(1), QN(1));
U2 : d_flipflop port map (QN(2), QN(1), RST_2, '1', Q(2), QN(2));
U3 : d_flipflop port map (QN(3), QN(2), RST_2, '1', Q(3), QN(3));

end STRUCTURE;