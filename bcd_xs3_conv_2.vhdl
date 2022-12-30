library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity bcd_xs3_conv_2 is
	port (A: in std_logic_vector(3 down to 0);
			B: out std_logic_vector(3 down to 0));
end entity;

architecture STRUCTURE of bcd_xs3_conv_2 is
	signal s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17: std_logic;
begin
	U0: not_2 port map (A(0),s0);
	U1: not_2 port map (A(1),s1);
	U2: not_2 port map (A(2),s2);
	U3: not_2 port map (A(3),s3);
	U4: and_2 port map (s0,s1,s4);
	U5: and_2 port map (A(0),A(1),s5);
	U6: and_2 port map (s5,s3,s6);
	U7: or_2 port map (s6,s4,s7);
	U8: or_2 port map (A(0),A(1),s8);
	U9: and_2 port map (s8,A(2),s9);
	U10: and_2 port map (s1,A(3),s10);
	U11: or_2 port map (s9,s10,s11);
	U12: and_2 port map (s5,s2,s12);
	U13: and_2 port map (s12,s3,s13);
	U14: and_2 port map (A(2),s0,s14);
	U15: and_2 port map (s14,s1,s15);
	U16: and_2 port map (A(3),A(0),s16);
	U17: or_2 port map (s13,s15,s17);
	U18: or_2 port map (s17,s16,s18);
	B(2)<=s18;
	B(3)<=s11;
	B(1)<=s7;
	B(0)<=s1;
end STRUCTURE;

