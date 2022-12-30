-- Author : Nidamanuri Sai Adarsh 
-- Roll No : 2103123

library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity demux1x4 is
   port( I0 : in std_logic;                               
         S : in std_logic_vector(1 downto 0);             
         O : out std_logic_vector(3 downto 0));           
end demux1x4; 

architecture STRUCTURE of demux1x4 is 

signal SIG_0,SIG_1 : std_logic; 

begin
   
U0 : demux1x2 port map (I0, S(0), SIG_0, SIG_1);
U1 : demux1x2 port map (SIG_0, S(1), O(0), O(1));
U2 : demux1x2 port map (SIG_1, S(1), O(2), O(3));

end STRUCTURE;