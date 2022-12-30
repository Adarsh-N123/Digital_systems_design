library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity neg_d_latch is                                    
    port( D : in std_logic;                           
          LTCHN : in std_logic;                       
          Q : buffer std_logic;                       
          QC : out std_logic);                        
end neg_d_latch;


architecture STRUCTURE of neg_d_latch is


begin
  
   process (D, LTCHN)
	begin
	
	   if LTCHN = '0' then
	       Q <= D;
		end if;
		
   end process;
	 
	U : not_2 port map (Q, QC);

end STRUCTURE;