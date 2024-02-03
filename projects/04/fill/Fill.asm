// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

@8192
D = A;
@R1
M = D; // R1 = 8192

(LOOP)
@KBD
D = M;
@WHITE
D;JEQ //KBD == 0; JMP WHITE
@BLACK
D;JNE //KBD != 0; JMP BLACK
@LOOP 
0;JMP

(BLACK)
@i
M = 0; //i = 0;
(BLACKLOOP)
@R1
D = M;
@i
D = D - M; 
@LOOP
D;JLE //8192-i <=0; JMP LOOP
@SCREEN
D = A;
@i
A = D + M;
M = -1; //RAM[SCREEN + I] = -1;
@i
M = M+1;//i +=1;
@BLACKLOOP
0;JMP

(WHITE)
@i
M = 0; //i = 0;
(WHITELOOP)
@R1
D = M;
@i
D = D - M; 
@LOOP
D;JLE //8192-i <=0; JMP LOOP
@SCREEN
D = A;
@i
A = D + M;
M = 0; //RAM[SCREEN + I] = 0;
@i
M = M+1;//i +=1;
@WHITELOOP
0;JMP