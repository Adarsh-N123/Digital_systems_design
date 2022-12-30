library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity add_sub_bcd is                                     
    port(A, B : in std_logic_vector(3 downto 0);          
         A_SBAR : in std_logic;                          
         Y : out std_logic_vector(7 downto 0);            
         INVA : out std_logic;                            
         INVB : out std_logic);                          
end add_sub_bcd;


architecture STRUCTURE of add_sub_bcd is
    
	 signal C, D, E, O1, O2, add, PART_1, PART_2 : std_logic_vector(3 downto 0);
	 signal s, O, s1, s2, s3 : std_logic;
    signal SUM, VAL_BCD : std_logic_vector(4 downto 0);
	 
begin
   
	U0 : to_bcd_conv_2 port map (A, C, INVA);
	U1 : to_bcd_conv_2 port map (B, D, INVB);
	
	U2 : not_2 port map (A_SBAR, s);
	U3 : xor2 port map (D(3), s, E(3));
	U4 : xor2 port map (D(2), s, E(2));
	U5 : xor2 port map (D(1), s, E(1));
	U6 : xor2 port map (D(0), s, E(0));
	
	U7 : bit4adder port map (C, E, s, SUM);
	
	U8 : not_2 port map (SUM(2), s1);
	U9 : and_2 port map (s1, SUM(1), s2);
	U10 : or_2 port map (s2, SUM(2), s3);
	U11 : and_2 port map (s3, SUM(3), O);
	
	add(0) <= '0' ; add(3) <= '0' ; add(2) <= O ; add(1) <= O;
	
	U12 : bit4adder port map (add, SUM(3 downto 0), '0', VAL_BCD);
	
	PART_1 <= "000" & VAL_BCD(4);
	PART_2 <= VAL_BCD(3 downto 0);
	
	U13 : bcd_xs3_conv_2 port map (PART_1, O1);
	U14 : bcd_xs3_conv_2 port map (PART_2, O2);
	
	Y <= O1 & O2;

end STRUCTURE;