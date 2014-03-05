// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

@8191
D=A
@pos
M=D

(FILL)
  @24576
  D=M
  @CLEAR
  D;JEQ  //Jump to clearing loop
  @pos
  D=M
  @FILL
  D;JEQ //If screen is full jump to beginning
  @pos
  D=M
  @16384
  A=A+D
  M=-1  //Fill row
  @pos
  M=M-1 //Decrement pos
  @FILL
  0;JMP


(CLEAR)
  @24576
  D=M
  @FILL
  D;JNE
  @8191
  D=A
  @pos
  D=M
  @CLEAR
  D;JEQ //If screen is clear jump to beginning
  @pos
  D=M
  @16384
  A=A+D
  M=0
  @pos
  M=M+1
  @CLEAR
  0;JMP

//Notes: maybe set pos directly to screen pos, check if end or beginning of
//screen is reached
