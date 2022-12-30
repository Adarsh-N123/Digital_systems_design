-- Author : Nidamanuri SaiAdash
-- Roll No : 2103123




library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity xor_2 is 
	port(I0 , I1 : in std_logic;
		  O0 : out std_logic);
end entity;

architecture STRUCTURE of xor_2 is 
	signal S0, S1, S2, S3 : std_logic;
begin
	U0 : not_2 port map (I0, S0);
	U1 : not_2 port map (I1, S1);
	U2 : and_2 port map (I0, S1, S2);
	U3 : and_2 port map (I1, S0, S3);
	U4 : or_2 port map (S2, S3 , O0);
end STRUCTURE;