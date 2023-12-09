10 REM *** Insertion Sort ***
12 REM *** Antibaddy
15 CLEAR
20 INPUT "Input length of array A (from 3 to 10):";L
30 IF L < 3 then goto 20
40 if L > 10 THEN GOTO 20
50 PRINT "You chose an array length of ";L
60 DIM A(L)
70 FOR J = 1 TO L
75      PRINT "Input A[" + str$(J) + "].";
80      INPUT A(J)
90 NEXT J
100 GOSUB 2000
140 PRINT "Sorting...": GOSUB 1000
150 GOSUB 2000
199 END
1000 REM SUB( Insertion Sort Array A ) 5 2 6
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
2000 REM SUB( Print Array A[] )
2010    PRINT: PRINT "A[ ";
2020    FOR J = 1 TO L
2030       PRINT A(J);" ";
2040    NEXT J: PRINT "]"
2050 RETURN
2999 REM
3000 REM SUB( Swap A(i) and A(i-1) )
3010    TMP = A(I)
3020    A(I) = A(I-1)
3030    A(I-1) = TMP
3040 RETURN
3999 REM