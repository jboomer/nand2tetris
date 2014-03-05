// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//init
  @CNT  //Mem. location of the counter
  M=0   //Set counter to 0
  @R2
  M=0 //Set R2 to 0

(LOOP)
  @R0   //If either argument is zero, skip to end
  D=M
  @END
  D;JEQ
  @R1
  D=M
  @END
  D;JEQ

  @CNT
  D=M
  @R0
  D=M-D //If counter>=R0: end
  @END
  D;JLE
  @R1
  D=M
  @R2
  M=M+D //R2=R2+R1
  @CNT
  M=M+1 //Increment counter
  @LOOP
  0;JMP //Loop


(END)
  @END
  0;JMP

