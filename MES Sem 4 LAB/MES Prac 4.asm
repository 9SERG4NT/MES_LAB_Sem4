ORG 0000H  ; Start address

; Initialize registers
MOV R0,#35H   ; (1) Load R0 with 35H
MOV R1,#0FFH  ; (2) Load R1 with FFH
MOV R2,#05H   ; (3) Load R2 with 05H
MOV R3,#0FFH  ; (4) Load R3 with FFH

; Addition operation with carry check
MOV A,R0      ; (5) Move R0 to accumulator
ADD A,R1      ; (6) Add R1 to A
JNC NO_CARRY  ; (7) Jump if no carry
MOV 50H,#01H  ; (8) Store 01H in 50H if carry
SJMP NEXT1    ; (9) Skip next instruction if carry
NO_CARRY:
MOV 50H,#00H  ; (10) Store 00H in 50H if no carry
NEXT1:
MOV 40H,A     ; (11) Store result of addition in 40H

; Subtraction operation
MOV A,R0      ; (12) Move R0 to A
CLR C         ; (13) Clear carry before subtraction
SUBB A,R1     ; (14) Subtract R1 from A with borrow
MOV 41H,A     ; (15) Store result in 41H
MOV 51H,C     ; (16) Store carry flag in 51H (0 if no borrow, 1 if borrow)

; Multiplication operation
MOV A,R0      ; (17) Move R0 to A
MOV B,R1      ; (18) Move R1 to B
MUL AB        ; (19) Multiply A and B
MOV 42H,A     ; (20) Store lower byte of result in 42H
MOV 43H,B     ; (21) Store higher byte of result in 43H

; Division operation
MOV A,R0      ; (22) Move R0 to A
MOV B,R2      ; (23) Move R2 to B
DIV AB        ; (24) Divide A by B
MOV 44H,A     ; (25) Store quotient in 44H
MOV 45H,B     ; (26) Store remainder in 45H

; AND operation
MOV A,R0      ; (27) Move R0 to A
ANL A,R1      ; (28) Perform A AND R1
MOV 46H,A     ; (29) Store result in 46H

; OR operation
MOV A,R0      ; (30) Move R0 to A
ORL A,R1      ; (31) Perform A OR R1
MOV 47H,A     ; (32) Store result in 47H

;XOR operation
MOV A,R0
XRL A,R1
MOV 48H,A

; Complement (NOT) operation
MOV A,R0      ; (33) Move R0 to A
CPL A         ; (34) Complement A
MOV 48H,A     ; (35) Store result in 48H

MOV A,R0      ; (36) Move R0 to A
CPL A         ; (37) Complement A again
MOV 49H,A     ; (38) Store result in 49H

; Rotate left
MOV A,R0      ; (39) Move R0 to A
RL A          ; (40) Rotate left
MOV 4AH,A     ; (41) Store result in 4AH

; Rotate right
MOV A,R0      ; (42) Move R0 to A
RR A          ; (43) Rotate right
MOV 4BH,A     ; (44) Store result in 4BH

; Rotate right through carry
MOV A,R0      ; (45) Move R0 to A
CLR C         ; (46) Clear carry
RRC A         ; (47) Rotate right through carry
MOV 4DH,A     ; (48) Store result in 4DH

; Increment operation
MOV A,R0      ; (49) Move R0 to A
INC A         ; (50) Increment A
MOV 4EH,A     ; (51) Store result in 4EH

; Decrement operation
MOV A,R0      ; (52) Move R0 to A
DEC A         ; (53) Decrement A
MOV 4FH,A     ; (54) Store result in 4FH

; Swap nibbles
MOV A,R0      ; (55) Move R0 to A
SWAP A        ; (56) Swap nibbles of A
MOV 52H,A     ; (57) Store result in 52H

; Compare operation
MOV A,R0      ; (58) Move R0 to A
CJNE A,01H,NOT_EQUAL  ; (59) Compare A with 01H, jump if not equal
MOV 53H,#01H  ; (60) Store 01H in 53H if equal
SJMP COMPARE_DONE     ; (61) Skip next instruction
NOT_EQUAL:
MOV 53H,#00H  ; (62) Store 00H in 53H if not equal
COMPARE_DONE:

; Infinite loop
HERE: SJMP HERE  ; (63) Infinite loop to halt execution

END  ; End of program
