library IEEE;
use IEEE.std_logic_1164.all;
                
entity clkdiv is
port ( CLK_IN : in std_logic;                                                         
       RSTN : in std_logic; 
       CLK_OUT : out std_logic); 
end entity;
                                      
												  
architecture FUNCTIONALITY of clkdiv is

signal CNT : integer := 1;
signal temporary_val : std_logic := '0';
                                                        
begin

process(CLK_IN, RSTN)

begin
if (RSTN = '0') then
    CNT <= 1;
	 temporary_val <= '0';
elsif (CLK_IN'event and CLK_IN = '1') then
	 CNT <= CNT+1;

if (CNT = 50000000) then
	 temporary_val <= not temporary_val;
	 CNT <= 1;
end if;

end if;

CLK_OUT <= temporary_val;
end process;

end architecture;