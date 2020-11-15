// John Burk Merryman 126008357

// File name: mod.asm

// This program calculates the modulo of two given numbers a and b, which is a%b in math. 
// The value of a is stored in RAM[0] (R0), and the value of b is stored in RAM[1] (R1). 
// The value a is non-negative integer and b is positive integer. 
// The modulo value is stored in RAM[2] (R2).



// Put your code below this line
(LOOP)
	@R0
	D=M 	//D=RAM[0]
	@R1 	
	D=D-M 	//D=D-RAM[1]
	
	@ZERO
	D;JEQ	//jump if a - b = 0
	
	@LT
	D;JLT 	//jump if a - b < 0
	
	//update value at R0
	@R1
	D=M 	//D=RAM[1]
	@R0
	M=M-D 	//RAM[0]=RAM[0]-D
	
	@LOOP
	0;JMP	//unconditional jump while a > b
	

(LT)
	//occurs when a-b < 0
	//R2=a, END
	@R0
	D=M		//D=Ram[0]

	@R2
	M=D 	//Ram[2] = D
	
	@END
	0;JMP 	//unconditional jump to END loop
	
(ZERO)
	//occurs when a-b=0
	//R2=0, END
	@0
	D=A 	//D=0
	
	@R2
	M=D 	//RAM[2]=0
	
	@END
	0;JMP 	//unconditional jump to END loop

(END)
	@END
	0;JMP	//infinite loop to end program