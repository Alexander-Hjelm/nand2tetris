// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//R0 and R1 are inputs, already defined

// ADDITION
//@R0
//D=M
//@R1
//D=D+M
//@R2
//M=D

// ADDITION OF CONSTANTS
//@3
//D=A
//@5
//D=D+A
//@R2
//M=D  //Should be 8

// MULTIPLICATION

@R1
D=M
@i	//index = M[R1], counting down
M=D

@cout	//output (final mult)
M=0

(LOOP)

@i	//load index
D=M

@END
D;JEQ	//Jump to exit if D (i) is equal to 0

@1	//index -= 1
D=D-A
@i
M=D

@R0
D=M	//D=M[R0]
@cout   //store in cout
M=M+D	//subsequent addition

@LOOP
0;JMP	//Jump to beginning of loop

(END)

@cout	//store cout in R2
D=M
@R2
M=D