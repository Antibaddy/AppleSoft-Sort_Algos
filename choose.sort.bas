10 REM *** Choose Sort Algorithm ***
12 REM *** Antibaddy
100 CLEAR : HOME
101 PRINT "CHOOSE THE SORT ALGORITHM DEMONSTRATION"
102 PRINT "Antibaddy 2023": PRINT
105 GOSUB 4000
110 PRINT "Input array length (from ";str$(mnL);" to ";str$(mxL);")";
115 INPUT L
120 IF L < mnL THEN GOTO 115
125 if L > mxL THEN GOTO 115
130 PRINT: PRINT "Generating ";L;" random numbers and        inserting into A[]..."
135 GOSUB 5000
140 GOSUB 6000 : REM GOSUB 9700
145 PRINT "Choose:": PRINT "1. Selection, 2. Insertion, 3. Bubble"; : INPUT C
150 IF (C <> 1) AND (C <> 2) AND (C <> 3) THEN GOTO 145
165 PRINT : PRINT
170 IF C = 1 THEN PRINT "Selection Sorting..." : GOSUB 1000
175 IF C = 2 THEN PRINT "Insertion Sorting..." : GOSUB 2000
180 IF C = 3 THEN PRINT "Bubble Sorting..." : GOSUB 2200
190 PRINT : PRINT : PRINT "Finished!"
199 END
1000 REM SUB SELECTION_SORT( A[] ) Selection Sort Array A
1001 REM input: A, an array of numbers
1002 REM for current from 1 to length of A - 1:
1003 REM    set minIndex to current
1004 REM    for i from current + 1 to length of A:
1005 REM        if A[i] < A[minIndex]:
1006 REM            set minIndex to i
1007 REM        swap A[current] and A[minIndex]
1010    FOR CURRENT = 1 TO L-1
1015        IMIN = CURRENT
1020        FOR I1 = CURRENT+1 TO L
1025            IF A(I1) < A(IMIN) THEN IMIN = I1
1030        NEXT I1
1035        IF IMIN <> CURRENT THEN GOSUB 1100 : GOSUB 6000
1040    NEXT CURRENT
1098 RETURN
1099 REM
1100 REM SUB SWAP_WITH_MIN(A[]) swap A[current] and A[IMIN]
1105    TMP = A(CURRENT)
1110    A(CURRENT) = A(IMIN)
1115    A(IMIN) = TMP
1125 RETURN
1199 REM
2000 REM SUB INSERTION_SORT( A[] ) Insertion Sort Array A
2010    FOR CURRENT = 2 TO L
2020       I = CURRENT
2030       REM Start of WHILE LOOP
2035           IF (I <= 1) THEN GOTO 2080
2040           IF (I > 1) AND (A(I) < A(I-1)) THEN GOSUB 2100 : GOSUB 6000
2045           I = I-1
2050           GOTO 2030
2070       REM end of WHILE LOOP
2080    NEXT CURRENT
2090 RETURN
2099 REM
2100 REM SUB SWAP_A_MINUS_A( A[] ) Swap A(i) and A(i-1)
2110    TMP = A(I)
2115    A(I) = A(I-1)
2120    A(I-1) = TMP
2130 RETURN
2199 REM
2200 REM SUB BUBBLE_SORT( A[] ) Bubble Sort Array A()
2201 REM Compare A[0] and A[1]. If A[0] is bigger than A[1], swap the 
2202 REM elements. Move to the next element, A[1] (which might now
2203 REM contain the result of a swap from the previous step), and 
2204 REM compare it with A[2]. If A[1] is bigger than A[2], swap the
2205 REM elements. Do this for every pair of elements until the end 
2206 REM of the list. Do steps 1 and 2 n times.
2210    FOR J1 = 1 TO L
2215        FOR I = 1 TO L-1
2220            IF (A(I) > A(I+1)) THEN GOSUB 2300 : GOSUB 6000
2223            REM GOSUB 9700
2225            REM print "J:";J1;" I:";i : GOSUB 9600
2230        NEXT I
2235    NEXT J1
2298 RETURN
2299 REM
2300 REM SUB SWAP_A_PLUS_A( A[] ) Swap A(i) and A(i+1)
2310    TMP = A(I)
2315    A(I) = A(I+1)
2320    A(I+1) = TMP
2330 RETURN
2399 REM
4000 REM SUB INIT() Set up random number generator and variables
4005    NFINITY = 32767 : mnL = 3 : mxL = 40
4010    REM Seed RANDOMIZE and start game
4015    VTAB 22: PRINT "Press any key to start sorting...          "
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
5000 REM SUB BUILD_ARRAY( A[L] ) enters random numbers into Array A[]
5001 REM 1 (Magenta), 2 (Dark Blue), 3 (Violet), 4 (Dark Green), 5 (Dark Gray), 
5002 REM 6 (Medium Blue), 7 (Light Blue), 8 (Brown), 9 (Orange), 10 (Light Gray), 
5003 REM 11 (Pink), 12 (Bright Green), 13 (Yellow), 14 (Aqua) 
5005    DIM A(L) : DIM C(39) : X = 1
5010    FOR J2 = 1 TO L
5015        A(J2) = FN RAN(39)
5020        C(A(J2)) = X
5025        X=X+1
5030        IF X > 14 THEN X = 1 
5045    NEXT J2
5055 RETURN
5999 REM
6000 REM SUB DRAW_ARRAY( A[] ) Draws a graph of the array A[] on lowres screen
6005    FOR J3 = 1 TO L
6010        REM Blank line first
6015        COLOR = 0 : VLIN 0,39 AT (J3-1)
6020        COLOR = C(A(J3))
6025        VLIN 39-A(J3),39 AT (J3-1)
6035    NEXT J3
6055 RETURN
6999 REM
9600 REM SUB WAIT_FOR_KEYPRESS()
9605    P = PEEK(49168)
9610    IF (PEEK(49152)) THEN GET K$: GOTO 9698
9615    GOTO 9610
9698 RETURN
9699 REM
9700 REM SUB PRINT_ARRAY( A[] ) Print Array
9710    PRINT: PRINT "A[ ";
9720    FOR J4 = 1 TO L
9730       PRINT A(J4);" ";
9740    NEXT J4: PRINT "]"
9750 RETURN
9799 REM
9800 REM SUB MOD_COLOR( INT L) Calculates the modulus color based on index into Array A[], J
9805    DEF FN MODCOL(C) = (14 - (INT(14 / C) * C))
9810 RETURN
9899 REM
9900 REM SUB RAN( INT R ) RAN Function for generating random number from 1 to R
9905    DEF FN RAN (R) = (INT(RND(1)*R)+1)
9910 RETURN