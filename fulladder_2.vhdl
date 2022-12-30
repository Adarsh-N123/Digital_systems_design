-- Author : Nidamanuri Sai Adarsh
-- Roll No : 2103123




library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity fulladder_2 is 
	port(I0 , I1 , I2 : in std_logic;
	     O0 , O1 : out std_logic);
end entity;


architecture STRUCTURE of fulladder_2 is
	signal S0, S1, S2 : std_logic;
begin
	U0 : halfadder_2 port map (I1, I2, S0, S1);
	U1 : halfadder_2 port map (I0, S0, O0, S2);
	U2 : or_2 port map (S2, S1, O1);
end STRUCTURE;