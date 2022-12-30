library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity asynchronous_counter is 
    
	 port(CLK : in std_logic;
         RST : in std_logic; 
         Q : inout std_logic_vector(3 downto 0)); 

end entity;

architecture STRUCTURE of asynchronous_counter is 

  signal QN : std_logic_vector(3 downto 0);
  signal CLK_D : std_logic;

begin
 
--U : clkdiv port map (CLK, RST, CLK_D);
U0 : d_flipflop port map (QN(0), CLK, RST, '1', Q(0), QN(0));
U1 : d_flipflop port map (QN(1), QN(0), RST, '1', Q(1), QN(1));
U2 : d_flipflop port map (QN(2), QN(1), RST, '1', Q(2), QN(2));
U3 : d_flipflop port map (QN(3), QN(2), RST, '1', Q(3), QN(3));

end STRUCTURE ;