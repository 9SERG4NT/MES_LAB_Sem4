ORG 0000H
START:
     SETB P3.4
	  SETB P3.3         
    MOV P1, #11111001B  
    CALL DELAY
            
		CLR P3.3 
    MOV P1, #10100100B
    CALL DELAY
           
    SETB P3.3
		CLR P3.4         
    MOV P1, #00110000B  
    CALL DELAY
    
	  CLR P3.3        
    MOV P1, #10011001B  
    CALL DELAY

    JMP START       


DELAY:
    MOV R0, #200
DELAY_LOOP:
    DJNZ R0, DELAY_LOOP
    RET

END
