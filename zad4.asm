@i
M = 0

(LOOP_START)
    @i
    D = M;
    @8
    D = D - A;
    @LOOP_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @1
    D = A;
    @i
    M = M + D;
    
    @LOOP_START
    0; JMP
(LOOP_END)

@32
D = A;
@i
M = D;

(LOOP1_START)
    @i
    D = M;
    @4096
    D = D - A;
    @LOOP1_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = 1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP1_START
    0; JMP
(LOOP1_END)

@4064
D = A;
@i
M = D;

(LOOP2_START)
    @i
    D = M;
    @4072
    D = D - A;
    @LOOP2_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @1
    D = A;
    @i
    M = M + D;
    
    @LOOP2_START
    0; JMP
(LOOP2_END)

@8
D = A;
@i
M = D;

(LOOP3_START)
    @i
    D = M;
    @4096
    D = D - A;
    @LOOP3_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = 1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP3_START
    0; JMP
(LOOP3_END)

@i
M = 0

(LOOP4_START)
    @i
    D = M;
    @512
    D = D - A;
    @LOOP4_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP4_START
    0; JMP
(LOOP4_END)

@513
D = A;
@i
M = D;

(LOOP5_START)
    @i
    D = M;
    @1025
    D = D - A;
    @LOOP5_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP5_START
    0; JMP
(LOOP5_END)

@1026
D = A;
@i
M = D;

(LOOP6_START)
    @i
    D = M;
    @1538
    D = D - A;
    @LOOP6_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP6_START
    0; JMP
(LOOP6_END)

@1539
D = A;
@i
M = D;

(LOOP7_START)
    @i
    D = M;
    @2051
    D = D - A;
    @LOOP7_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP7_START
    0; JMP
(LOOP7_END)

@2052
D = A;
@i
M = D;

(LOOP8_START)
    @i
    D = M;
    @2564
    D = D - A;
    @LOOP8_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP8_START
    0; JMP
(LOOP8_END)

@2565
D = A;
@i
M = D;

(LOOP9_START)
    @i
    D = M;
    @3077
    D = D - A;
    @LOOP9_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP9_START
    0; JMP
(LOOP9_END)

@3078
D = A;
@i
M = D;

(LOOP10_START)
    @i
    D = M;
    @3590
    D = D - A;
    @LOOP10_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP10_START
    0; JMP
(LOOP10_END)

@3591
D = A;
@i
M = D;

(LOOP11_START)
    @i
    D = M;
    @4103
    D = D - A;
    @LOOP11_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP11_START
    0; JMP
(LOOP11_END)

@7
D = A;
@i
M = D

(LOOP12_START)
    @i
    D = M;
    @519
    D = D - A;
    @LOOP12_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP12_START
    0; JMP
(LOOP12_END)

@518
D = A;
@i
M = D;

(LOOP13_START)
    @i
    D = M;
    @1030
    D = D - A;
    @LOOP13_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP13_START
    0; JMP
(LOOP13_END)

@1029
D = A;
@i
M = D;

(LOOP14_START)
    @i
    D = M;
    @1541
    D = D - A;
    @LOOP14_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP14_START
    0; JMP
(LOOP14_END)

@1540
D = A;
@i
M = D;

(LOOP15_START)
    @i
    D = M;
    @2052
    D = D - A;
    @LOOP15_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP15_START
    0; JMP
(LOOP15_END)

@2051
D = A;
@i
M = D;

(LOOP16_START)
    @i
    D = M;
    @2563
    D = D - A;
    @LOOP16_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP16_START
    0; JMP
(LOOP16_END)

@2562
D = A;
@i
M = D;

(LOOP17_START)
    @i
    D = M;
    @3074
    D = D - A;
    @LOOP17_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP17_START
    0; JMP
(LOOP17_END)

@3073
D = A;
@i
M = D;

(LOOP18_START)
    @i
    D = M;
    @3585
    D = D - A;
    @LOOP18_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP18_START
    0; JMP
(LOOP18_END)

@3584
D = A;
@i
M = D;

(LOOP19_START)
    @i
    D = M;
    @4096
    D = D - A;
    @LOOP19_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @LOOP19_START
    0; JMP
(LOOP19_END)

(END)
@END
0; JMP