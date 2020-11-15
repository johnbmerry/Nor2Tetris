// John Burk Merryman

// File name: aggie.asm

// The program must draw the letters ATM on the screen if a key is pressed and clear the screen if no key is pressed.  
// You will need to draw it pixel by pixel because HACK asm has no utilities for drawing text.
// The program runs an infinite loop that listens to the keyboard input.

// State any other assumptions made in your program as comments below and in your Technical report

// Assumptions (as applicable)

//pressing any key on the keyboard will cause  a version of ATM to display on the screen
//a specific series of values were loaded into certain RAM loactions to produce this pattern
//this RAM location is calculated thus: RAM[16384 + r . 32 + c/16]
//HACK computer has 256 rows of 512 pixels
//therefore, contents are represented in 8K memory map beginning at RAM[16384] (@SCREEN)
//each row is represented by 32 consecutive 16-bit words

// Put your code below this line

@place
M=0
(WAIT_FOR_KEY_PRESS)
	// checks for KBD inputs and interprets the proper command (jmp to WRITE if KBD input = true, else CLEAR the screen)
	@KBD  		// @24576
	D=M 		// D = RAM[KBD]
	@CLEAR
	D;JEQ		// jump to CLEAR if no input (RAM[KBD]) is false (=0)
	@WRITE
	D;JGT 		// jump if keyboard input (RAM[KBD]) is true (>0)

	@WAIT_FOR_KEY_PRESS
	0;JMP 		// infinite loop until a key is pressed or not pressed
	
(WRITE)
	// sets hardcoded pixels to black
	
	//A
	@480 		//@value	
	D=A
	@SCREEN 	//@RAM_address
	M=D
	@1008		
	D=A 
	@16416
	M=D
	@3612		
	D=A 
	@16448
	M=D
	@4092		
	D=A 
	@16480
	M=D
	@4092		
	D=A 
	@16512
	M=D
	@1806		
	D=A 
	D=A+D
	@16544
	M=D
	@1806		
	D=A 
	D=A+D
	@16576
	M=D
	
	//T
	@8184		
	D=A 
	@16385
	M=D
	@8184		
	D=A 
	@16417
	M=D
	@8184		
	D=A 
	@16449
	M=D
	@448		
	D=A 
	@16481
	M=D
	@448		
	D=A 
	@16513
	M=D
	@448		
	D=A 
	@16545
	M=D
	@448		
	D=A 
	@16577
	M=D
	
	//M
	@28702	
	D=A 
	D=A+D
	@16386
	M=D
	@28219	
	D=A 
	D=A+D
	@16418
	M=D
	@29683	
	D=A 
	D=A+D
	@16450
	M=D
	@28899	
	D=A 
	D=A+D
	@16482
	M=D
	@28675	
	D=A 
	D=A+D
	@16514
	M=D
	@28675	
	D=A 
	D=A+D
	@16546
	M=D
	@28675	
	D=A 
	D=A+D
	@16578
	M=D
	
	//set place to last known register location
	D=A
	@SCREEN
	D=D-A 		//D=address - SCREEN
	
	//allows the painted pixels to be cleared
	@place // starting point
	M=D // last known register location
	@WAIT_FOR_KEY_PRESS
	0;JMP // jump to LOOP
	
(CLEAR)
	// removes all inputs from SCREEN
	@place
	D=M // put place into D
	@WAIT_FOR_KEY_PRESS
	D;JLT // jump to LOOP if we are at less than minimum (0)
	@place
	D=M
	@SCREEN
	A=A+D // calculate place in the screen
	M=0 // fill pixel with white
	@place
	M=M-1 // decrease place
	@WAIT_FOR_KEY_PRESS
	0;JMP // jump to LOOP
