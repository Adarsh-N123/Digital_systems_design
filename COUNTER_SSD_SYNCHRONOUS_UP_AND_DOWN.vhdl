-- Author : NIDAMANURI SAI ADARSH 
-- Roll No. : 2103123




library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity COUNTER_SSD_SYNCHRONOUS_UP_AND_DOWN is                                          
	port(CLK : in std_logic;                                        
		RSTN : in std_logic;                                         
		UP_DN : in std_logic;                                        
		LDN : in std_logic;                                          
		E : in std_logic;                                            
		D : in std_logic_vector(3 downto 0);                         
		Q : inout std_logic_vector(3 downto 0));                     
end COUNTER_SSD_SYNCHRONOUS_UP_AND_DOWN;

architecture FUNCTIONALITY of COUNTER_SSD_SYNCHRONOUS_UP_AND_DOWN is
signal OUTPUT_CLOCK,RESET_SIG_1,RESET_SIG_2: std_logic;
signal R: std_logic_vector(3 downto 0);
signal QZ: std_logic_vector(3 downto 0);
signal SIG: std_logic_vector(28 downto 0);
begin

	
 U5 : mux2x1 port map('1','0',UP_DN,R(0));
 U6 : mux2x1 port map('1','0',UP_DN,R(3));
 R(2)<='0';
 R(1)<='0';
 
 SIG(27)<= NOT(Q(0) AND Q(3) AND (NOT Q(2)) AND (NOT Q(1))); 
 SIG(28)<= NOT((not(Q(0))) AND (not(Q(1))) AND (not(Q(2))) AND (not(Q(3))));
 
 U7 : mux2x1 port map(SIG(28),SIG(27),UP_DN,RESET_SIG_1);
 
 RESET_SIG_2<= RSTN AND RESET_SIG_1;

  SIG(0)<=E;
  
--  U : clkdiv port map(CLK, '1', OUTPUT_CLOCK);
	
  --UNIT_BANK:
  FOR_LOOP_BANK:
  
  for i in 0 to 3 generate
  
   U1: xor2 port map(SIG(6*i), Q(i), SIG(6*i+1));
	U2: mux2x1 port map(D(i), SIG(6*i+1), LDN, SIG(6*i+2));
	U3: mux2x1 port map(R(i), SIG(6*i+2), RESET_SIG_2, SIG(6*i+3));
	U4: dflipflop port map(SIG(6*i+3), CLK, '1', '1', SIG(6*i+4), QZ(i));
	
	U5: mux2x1 port map(QZ(i), SIG(6*i+4), UP_DN, SIG(6*i+5));
	U6: and_2 port map(SIG(6*i+5),SIG(6*i), SIG(6*i+6));

  end generate;
	
Q(0)<=SIG(4);
Q(1)<=SIG(10);
Q(2)<=SIG(16);
Q(3)<=SIG(22);

	U8: SSD port map(Q, Q1, F);
end functionality;