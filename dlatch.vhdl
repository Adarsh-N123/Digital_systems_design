library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity dlatch is                                    
    port( D : in std_logic;                          
          LTCH : in std_logic;                      
          Q : buffer std_logic;                      
          QC : out std_logic);                       
end dlatch;


architecture STRUCTURE of dlatch is


begin
  
   process (D, LTCH)
	begin
	
	   if LTCH = '1' then
	       Q <= D;
		end if;
		
   end process;
	 
	U : not_2 port map (Q, QC);

end STRUCTURE;