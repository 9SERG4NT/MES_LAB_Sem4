      ORG 0000H
mov 40H,#20H
mov 41H,#21H
mov 42H,#22H
mov 43H,#23H
mov 44H,#24H
       
mov R0,#40H
mov R1,#60H
mov R2,#05H
       
LOOP:mov A, @R0
	mov @R1,A
	Inc R0
	Inc R1
	DJNZ R2,LOOP


 MOV R0, #40H  
        MOV R1, #60H  
        MOV R2, #05H  
        
CHECK:  MOV A, @R0    
        MOV B, @R1    
        CJNE A, B, ERROR  
        INC R0
        INC R1
        DJNZ R2, CHECK  
        
        
        MOV P1,#00000000B 
        SJMP $

ERROR:  CLR P1.0  
        SJMP $
        
        END
