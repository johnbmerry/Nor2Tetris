// John Burk Merryman 126008357

// File name: gcd.asm

// This program calculates the greatest common divisor (gcd) of two given 
// non-negative integers, which are stored in RAM[0] (R0) and RAM[1] (R1). 
// The gcd is stored in RAM[2] (R2).



// Put your code below this line

//create variables a and b as counters to preserve integrity of initial inputs
//RAM[0] = a
@0
D=M 	//D=R0
@a 	
M=D 	//R[a]=D

//RAM[1] = b
@1
D=M 	//D=R1
@b 	
M=D 	//R[b]=D

(LOOP)
	//continue until a or b = 0 and, using the Euclidian Algorithm, the GCD is found
	
	//if a=0, R2=b, END
	@a
	D=M 	//D=Ra
	
	@AZERO
	D;JEQ 	//jump if a=0
	
	//if b=0, R2=a, END
	@b
	D=M 	//D=R[b]
	
	@BZERO
	D;JEQ 	//jump if b=0
	
	//find remainder of a/b
	@REMAINDER
	0;JMP 	//unconditional jump to REMAINDER
	
	//set new values
	@SET
	0;JMP 	//uncondintional jump to SET
	
(SET)
	//set new values, GCD(a,b) = GCD(b,rem)
	//R0=R1 / a = b
	@b
	D=M 	//D=Rb
	
	@a
	M=D 	//Ra=D
	
	//Rb=rem / b = rem
	@rem
	D=M 	//D=RAM[rem]
	
	@b
	M=D 	//R[b]=D
	
	@LOOP
	0;JMP 	//unconditional jump to LOOP while a,b != 0
	
(REMAINDER)
	//mod.asm
	//used to find the remainder of a/b
	@a
	D=M 	//D=RAM[a]
	@b 	
	D=D-M 	//D=D-RAM[b]
	
	@ZERO
	D;JEQ	//jump if a - b = 0
	
	@LT
	D;JLT 	//jump if a - b < 0
	
	//update value at a
	@b
	D=M 	//D=RAM[b]
	@a
	M=M-D 	//RAM[a]=RAM[a]-D
	
	@REMAINDER
	0;JMP	//unconditional jump while a > b

(LT)
	//occurs when a-b < 0
	//sets variable rem as the remainder, rem=a
	@a
	D=M		//D=Ram[a]

	@rem
	M=D 	//Ram[rem] = D
	
	@SET
	0;JMP 	//unconditional jump to main SET to update the new values
	
(ZERO)
	//occurs when a-b = 0
	//sets variable rem as the remainder, rem=0
	@0
	D=A 	//D=0
	
	@rem
	M=D 	//RAM[rem]=0	
	
	@SET
	0;JMP 	//unconditional jump to main SET to update the new values
	
(AZERO)
	//only occurs if a=0
	//set R2 to GCD (b) and END
	@b
	D=M 	//D=Rb
	
	@2
	M=D 	//R2=D
	
	@END
	0;JMP	//unconditional jump to END loop
	
(BZERO)
	//only occurs if b=0
	//set R2 to GCD (a) and END
	@a
	D=M 	//D=Ra
	
	@2
	M=D 	//R2=D
	
	@END
	0;JMP	//unconditional jump to END loop
	
(END)
	@END
	0;JMP	//infinite loop to end program