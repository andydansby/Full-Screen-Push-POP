1 INK 0
2 BORDER 1
3 PAPER 7
4 CLS
8 REM 1st screen third
9 REM 1st band
10 POKE 16384,255:REM $4000 <
15 POKE 16415,255:REM $401F
20 POKE 16416,255:REM $4020 <
25 POKE 16447,255:REM $403F
30 POKE 16448,255:REM $4040 <
35 POKE 16479,255:REM $405F
40 POKE 16480,255:REM $4060 <
45 POKE 16511,255:REM $407F
50 POKE 16512,255:REM $4080 <
55 POKE 16543,255:REM $409F
60 POKE 16544,255:REM $40A0 <
65 POKE 16575,255:REM ROW 040
70 POKE 16576,255:REM $40C0 <
75 POKE 16607,255:REM ROW 048
80 POKE 16608,255:REM $40E0 <
85 POKE 16639,255:REM ROW 056
99 REM 2nd band
100 POKE 16640,255:REM ROW 000
105 POKE 16671,255:REM ROW 000
110 POKE 16672,255:REM ROW 008
115 POKE 16703,255:REM ROW 008
120 POKE 16704,255:REM ROW 016
125 POKE 16735,255:REM ROW 016
130 POKE 16736,255:REM ROW 024
135 POKE 16767,255:REM ROW 024
140 POKE 16768,255:REM ROW 032
145 POKE 16799,255:REM ROW 032
150 POKE 16800,255:REM ROW 040
155 POKE 16831,255:REM ROW 040
160 POKE 16832,255:REM ROW 048
165 POKE 16863,255:REM ROW 048
170 POKE 16864,255:REM ROW 056
175 POKE 16895,255:REM ROW 056
