;
;////	PUT FILE INTRODUCTION.	////
;
			.ORIG	X3000
		START	LDI	R6, QUEPTR	; INITIALIZE QUEUE POINTER R6.
			JSR	INNUM		; NUMERATOR 
			JSR	CONSTRT		; CONVERT NUMERATOR
			STI	R1, NUMER	;
			JSR	INNUM		; DENOMINATOR USING X4001 TO SAVE.
			JSR	CONSTRT		; CONVERT DENOMINATOR
			JSR	OUTRESLT	; OUTPUTS THE RESULT.
			JSR	REPEAT		; IF YES GOES BACK TO START.
		END	HALT
		QUEPTR	.FILL	X3FFF		
		NUMER	.FILL	X4000
		DENUMER .FILL	X4001
;
;//// 	START INPUT NUMBERS	////
;
		INNUM	ST	R0, SAVER0
			ST	R1, SAVER1
			ST	R2, SAVER2
			ST	R3, SAVER3
			ST	R4, SAVER4
			ST	R5, SAVER5
			ST	R6, SAVER6
			ST	R7, SAVER7
			AND	R4, #0		; CLEARS R4 FOR A LOOP COUNTER
			LEA	R0, PROMPT
			TRAP	X22
			LD	R3, NEGENTER
			LD	R5, INPUTOFF
		AGAIN	TRAP	X20
			TRAP 	X21
			ADD	R2, R0, R3
			BRZ	NEXT
			ADD	R0, R0, R5
			ADD	R4, R4, #1	; INCREMENT THE LOOP R4++
			JSR	PUSH
			BRNZP	AGAIN
		NEXT	LD	R0, SAVER0
			LD	R1, SAVER1
			LD	R2, SAVER2
			LD	R3, SAVER3
			LD	R5, SAVER5
			LD	R7, SAVER7
			RET
;
;//// 	END INPUT NUMBERS ////
;
		NEGENTER .FILL	XFFF6		; ENDS THE INPUT WHEN ENTER IS MOST RECENT VALUE.
		INPUTOFF .FILL	XFFDO		; ADJUST INPUT OFFSET.
		SAVER0	.FILL	X0000
		SAVER1	.FILL	X0000
		SAVER2	.FILL	X0000
		SAVER3	.FILL	X0000
		SAVER4	.FILL	X0000
		SAVER5	.FILL	X0000
		SAVER6	.FILL	X0000
		SAVER7	.FILL	X0000
;
;//// 	START PUSH/POP INTO QUEUE ////
; 
		POP	ST	R2, SAVER2
			ST	R1, SAVER1
			LD	R1, BASE
			ADD	R1, R1, #-1
			ADD	R2, R6, R1
			BRZ	FAIL_EXIT
			LDR	R0, R6, #0
			ADD 	R6, R6, #1
			BRNZP	WIN_EXIT
		PUSH	ST	R2, SAVER2
			ST	R1, SAVER1
			LD	R1, MAX
			ADD	R2, R6, R1
			BRZ	FAIL_EXIT
			ADD	R6, R6, #-1
			STR	R0, R6, #0
		WIN_EXIT LD	R1, SAVER1
			LD	R2, SAVER2
			AND	R5, R5, #0
			RET
		FAIL_EXIT LD	R1, SAVER1
			LD	R2, SAVER2
			AND	R5, R5, #0
			ADD	R5, R5, #1
			JSR	END
;
;//// 	END PUSH/POP INTO QUEUE ////
;
		BASE	.FILL	XC001
		MAX	.FILL	XC00A
;
;////	START CONVERT AND STORE ////
;
		CONSTRT ST	R7, SAVER7
			JSR	POP			; POP FIRST ELEMENT
			ADD	R1, R1, R0		; ADD THAT ELEMENT TO R1
			BRZ	CONEND			; BRANCH IF VALUE WAS A ZERO
			ADD	R4, #-1
			LD	R3, VAL101		; LOAD 10			
			JSR	MULTPY
			ADD	R4, #-1
			BRZ	CONEND
			LD	R3, VAL102
			JSR	MULTPY
			ADD	R4, #-1
			BRZ	CONEND
			LD	R3, VAL103
			JSR	MULTPY
			ADD	R4, #-1
			BRZ	CONEND
			LD	R3, VAL104
			JSR	MULTPY
			ADD	R4, #-1
		CONEND	LD	R7, SAVER7
			RET		
;
;////	END CONVERT AND STORE ////
;
		VAL101	.FILL	X000A
		VAL102	.FILL	X0064
		VAL103	.FILL	X03E8
		VAL104	.FILL	X2710
;
;////	START MULTIPLY ////
;
		MLTPY	JSR	POP
		LOOP	ADD	R3, R3, R3
			ADD	R0, R0, #-1
			BRP	LOOP
			ADD	R1, R1, R3
			RET
;
;////	END MULTIPLY
;
;
;////	START DIVIDE SEQUENCE ////
;	
		DIVIDE	ST	R0, SAVER0
			ST	R1, SAVER1
			ST	R2, SAVER2
			ST	R3, SAVER3
			ST	R4, SAVER4
			ST	R5, SAVER5
			ST	R6, SAVER6
			ST	R7, SAVER7
;
;////	END DIVIDE SEQUENCE ////
;	
