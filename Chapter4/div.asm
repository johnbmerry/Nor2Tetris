//John Burk Merryman 126008357

// File name: div.asm

// The program calculates the quotient from a division operation. 
// The values of dividend a and divisor b are stored in RAM[0] (R0) and RAM[1] (R1), respectively. 
// The dividend a is a non-negative integer, and the divisor b is a positive integer. 
// Store the quotient in RAM[2] (R2). Ignore the remainder.


// Put your code below this line
//initialize R2=0
@R2
M=0

//create loop until dividend is diminished
(LOOP)
	//update divdend
	@1
	D=M		//D=RAM[1]
	@0
	M=M-D 	//RAM[0]=RAM[0]-D
	
	D=M 	//D=R0
	
	@END
	D;JLT	//unconditional jump to end if (a-b) < 0
	
	@R2
	M=M+1
	
	@END
	D;JEQ	//Unconditional jump to end if (a-b) = 0
	
	@LOOP
	0;JMP	//unconditional jump to loop until divdend is <= 0
	
(END)
	@END
	0;JMP	//infinite loop to end program