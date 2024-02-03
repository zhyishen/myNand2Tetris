@result
M = 0; // result = 0
@i
M = 0; // i=0

(LOOP)
@R1
D = M;
@i
D = D - M;
@SET
D;JLE //if b - i > 0 Jmp Loop

@R0
D = M; //D = R0;

@result
M = M + D; //result+=D;

@i
M = M + 1; //i+=1;
@LOOP
0;JMP

(SET)
@result
D = M;
@R2
M = D; //R3=result

(RET)
@RET
0;JMP
