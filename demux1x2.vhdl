-- Author : Nidamanuri Sai Adarsh 
-- Roll No : 2103123

library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity demux1x2 is
   port( I0, S0 : in std_logic;          
         O0, O1 : out std_logic );       
end demux1x2; 

architecture STRUCTURE of demux1x2 is 

signal SIG_0,SIG_1,SIG_2 : std_logic; 

begin
   
U0 : not_2 port map (S0, SIG_0);
U1 : and_2 port map (I0, S0, O0);
U2 : and_2 port map (I0, SIG_0, O1);

end STRUCTURE;