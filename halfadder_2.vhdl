-- Author : Nidamanuri Sai Adarsh
-- Roll No : 2103123




library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity halfadder_2 is
	port( I0, I1 : in std_logic;
			O0, O1 : out std_logic);
end entity;

architecture STRUCTURE of halfadder_2 is
	
	
begin
	U0 : xor_2 port map (I0, I1, O0);
	U1 : and_2 port map (I0, I1, O1);
end STRUCTURE;