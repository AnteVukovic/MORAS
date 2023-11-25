@i
M = 0;

(LOOP1_START)
    @i
    D = M;
    @0
    D = D - M;
    @LOOP1_END
    D; JGE
    
    @5
    M = M + 1;
    
    // i = i + 1
    @i
    M = M + 1;
    
    @LOOP1_START
    0; JMP
(LOOP1_END)

@i
M = 0;

(LOOP_START)
    @i
    D = M;
    @1
    D = D - M;
    @LOOP_END
    D; JGE
    
    @5
    M = M + 1;
    
    @i
    M = M + 1;
    
    @LOOP_START
    0; JMP
(LOOP_END)

(LOOP2_START)
    @i
    D = M;
    @2
    D = D - M;
    @LOOP2_END
    D; JGE
    
    @5
    M = M + 1;
    
    @i
    M = M + 1;
    
    @LOOP2_START
    0; JMP
(LOOP2_END)

@i
M = 0;

(LOOP3_START)
    @i
    D = M;
    @3
    D = D - M;
    @LOOP3_END
    D; JGE
    
    @5
    M = M + 1;
    
    @i
    M = M + 1;
    
    @LOOP3_START
    0; JMP
(LOOP3_END)

@i
M = 0;

(LOOP4_START)
    @i
    D = M;
    @4
    D = D - M;
    @LOOP4_END
    D; JGE
    
    @5
    M = M + 1;
    
    @i
    M = M + 1;
    
    @LOOP4_START
    0; JMP
(LOOP4_END)

(END)
@END
0; JMP