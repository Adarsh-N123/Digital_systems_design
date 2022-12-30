-- Author : Nidamanuri Sai Adarsh 
-- Roll No : 2103123

library IEEE;
use IEEE.std_logic_1164.all;
entity not_2 is
    port(I0 : in std_logic;          
         O0 : out std_logic); 
end not_2;
architecture notLogic of not_2 is
begin
    O0 <= not(I0) ;
end notLogic;