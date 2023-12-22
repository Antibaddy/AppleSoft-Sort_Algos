10 REM *** Insertion Sort ***
12 REM *** Antibaddy
100 CLEAR : HOME
101 PRINT "INSERTION SORT ALGORITHM DEMONSTRATION"
102 PRINT "Antibaddy (c) 2023": PRINT
105 GOSUB 4000
110 PRINT "Input length of array A (from ";str$(mnL);" to ";str$(mxL);")";
115 INPUT L
120 IF L < mnL THEN GOTO 115
125 if L > mxL THEN GOTO 115
130 PRINT: PRINT "Generating ";L;" random numbers and        inserting into A[]..."
135 GOSUB 5000
160 GOSUB 6000
165 PRINT : PRINT : PRINT "Sorting...": GOSUB 1000
170 PRINT : PRINT : PRINT "FINISHED!": GOSUB 2000
199 END
1000 REM SUB( A[] ) Insertion Sort Array A
1010    FOR CURRENT = 2 TO L
1020       I = CURRENT
1030       REM Start of WHILE LOOP
1035           IF (I <= 1) THEN GOTO 1080
1040           IF (I > 1) AND (A(I) < A(I-1)) THEN GOSUB 3000
1045           I = I-1
1050           GOTO 1030
1070       REM end of WHILE LOOP
1080    NEXT CURRENT
1090 RETURN
1999 REM
2000 REM SUB( A[] ) Print Array
2010    PRINT: PRINT "A[ ";
2020    FOR J = 1 TO L
2030       PRINT A(J);" ";
2040    NEXT J: PRINT "]"
2050 RETURN
2999 REM
3000 REM SUB SWAP( A[] ) Swap A(i) and A(i-1)
3010    TMP = A(I)
3015    A(I) = A(I-1)
3020    A(I-1) = TMP
3025    GOSUB 6000
3030 RETURN
3999 REM
4000 REM SUB INIT() Set up random number generator and variables
4005    NFINITY = 32767 : mnL = 10 : mxL = 40
4010    REM Seed RANDOMIZE and start game
4015    VTAB 22: PRINT "Press any key to start insertion sort          "
4020    REM clear keyboard strobe
4025    LET seed = 0: P = PEEK(49168)
4030    IF (PEEK(49152)) THEN GET K$: GOTO 4050
4035    seed = seed + 1
4040    if seed > NFINITY then seed = 0
4045    GOTO 4030
4050    seed = RND(-seed)
4055    GOSUB 9900 : GOSUB 9800
4060    GR :  COLOR = 15
4070 RETURN
4999 REM
5000 REM SUB BUILD_ARRAY (A[L]) enters random numbers into Array A[]
5001 REM 1 (Magenta), 2 (Dark Blue), 3 (Violet), 4 (Dark Green), 5 (Dark Gray), 
5002 REM 6 (Medium Blue), 7 (Light Blue), 8 (Brown), 9 (Orange), 10 (Light Gray), 
5003 REM 11 (Pink), 12 (Bright Green), 13 (Yellow), 14 (Aqua) 
5005    DIM A(L) : DIM C(39) : X = 1
5010    FOR J = 1 TO L
5015        A(J) = FN RAN(39)
5020        C(A(J)) = X
5025        X=X+1
5030        IF X > 14 THEN X = 1 
5045    NEXT J
5055 RETURN
5999 REM
6000 REM SUB DRAW_ARRAY( A[] ) Draws a graph of the array A[] on lowres screen
6005    FOR J = 1 TO L
6010        REM Blank line first
6015        COLOR = 0 : VLIN 0,39 AT (J-1)
6020        COLOR = C(A(J))
6025        VLIN 39-A(J),39 AT (J-1)
6035    NEXT J
6055 RETURN
6999 REM
9800 REM SUB MOD_COLOR( INT L) Calculates the modulus color based on index into Array A[], J
9805    DEF FN MODCOL(C) = (14 - (INT(14 / C) * C))
9810 RETURN
9900 REM SUB RAN( INT R ) RAN Function for generating random number from 1 to R
9905    DEF FN RAN (R) = (INT(RND(1)*R)+1)
9910 RETURN