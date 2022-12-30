library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity neg_d_flipflop is                                                 
   port( D : in std_logic;                                      
         CLCK : in std_logic;                                    
         CLEAR_SIG : in std_logic;                                   
         PRESET_SIG : in std_logic;                                   
         Q : buffer std_logic;                                  
         QC : out std_logic);                                   
end neg_d_flipflop;


architecture STRUCTURE of neg_d_flipflop is


begin
  
   process (CLEAR_SIG, PRESET_SIG, CLCK)
	begin
	   
		if CLEAR_SIG = '0' then
	       Q <= '0';
			 
		elsif PRESET_SIG = '0' then
	       Q <= '1';
			 
		elsif CLCK'event and CLCK = '0' then
	       Q <= D;
			 
		end if;	 
			 
	end process;
	
	U : not_2 port map (Q, QC);
	
end STRUCTURE;