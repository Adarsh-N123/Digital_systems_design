-- Author : Nidamanuri Sai Adarsh 
-- Roll No : 2103123

library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity mux4x1 is
   port( I : in std_logic_vector(3 downto 0);            
         S : in std_logic_vector(1 downto 0);            
         O0 : out std_logic);                            
end mux4x1; 

architecture STRUCTURE of mux4x1 is 

signal SIG_0,SIG_1 : std_logic; 

begin
   
U0 : mux2x1 port map (I(0), I(1), S(0), SIG_0);
U1 : mux2x1 port map (I(2), I(3), S(0), SIG_1);
U2 : mux2x1 port map (SIG_0, SIG_1, S(1), O0);

end STRUCTURE;