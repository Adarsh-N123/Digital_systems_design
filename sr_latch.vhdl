library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity sr_latch is                                       
   port( S : in std_logic;                               
         R : in std_logic;                               
         Q : buffer std_logic;                          
         QC : buffer std_logic);                       
end sr_latch;


architecture STRUCTURE of sr_latch is
 
  signal s0, s1 : std_logic;
  
begin

   U0 : and_2 port map(R, QC, s0);
	U1 : not_2 port map(s0, Q);
	U2 : and_2 port map(S, Q, s1);
	U3 : not_2 port map(s1, QC);
	
end STRUCTURE;