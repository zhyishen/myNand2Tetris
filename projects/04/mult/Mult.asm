@R0
D = M;
@a
M = D; //a = R0

@R1
D = M;
@b
M = D; //b = R1;

@result
M = 0; // result = 0;

@i
M = 0;

(LOOP)
@a
D = M; //D =a;

@result
M = M + D; //result+=D;

@i
M = M + 1; //i+=1;

D = M;
@b
D = D - M;
@LOOP
D;JLT //if b - i > 0 Jmp Loop

@result
D = M;
@R3
M = D; //R3=result

(RET)
@RET
0;JMP
