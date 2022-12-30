-- Author : Nidamanuri Sai Adarsh 
-- Roll No : 2103123

library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity mux2x1 is
   port( I0, I1, S0 : in std_logic;         
         O0 : out std_logic );              
end mux2x1; 

architecture STRUCTURE of mux2x1 is 

signal SIG_0,SIG_1,SIG_2 : std_logic; 

begin
   
U0 : not_2 port map (S0, SIG_0);
U1 : and_2 port map (I0, S0, SIG_1);
U2 : and_2 port map (I1, SIG_0, SIG_2);
U3 : or_2 port map (SIG_1, SIG_2, O0);

end STRUCTURE;