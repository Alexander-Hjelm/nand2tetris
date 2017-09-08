// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@8192
D=A
@SCREEN
D=D+A
@max_iter
M=D

(LOOP)

//loop over index i (from @SCREEN to @SCREEN + @max_iter)
@SCREEN
D=A
@i
M=D

//read const @KBD
@KBD
D=M
//@KBD was zero -> whiten the screen
@WHITE
D;JEQ

(BLACK)

//Set pixel i to off (-1)
@i
A=M
M=-1

//i++
@i
M=M+1

//loop condition
@max_iter
D=M
@i
D=D-M

@BLACK
D;JGT	//Jump to exit if D (i) is equal to 0

//Infinite loop (outer)
@LOOP
0;JMP

(WHITE)

//Set pixel i to on (1)
@i
A=M
M=0

//i++
@i
M=M+1

//loop condition
@max_iter
D=M
@i
D=D-M

@WHITE
D;JGT	//Jump to exit if D (i) is equal to 0

//Infinite loop (outer)
@LOOP
0;JMP
