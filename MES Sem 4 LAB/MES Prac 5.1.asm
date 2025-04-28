ORG 0000H
LJMP MAIN           ; Jump to main program

; Main program starts here
ORG 0030H
MAIN:
    MOV P1, #00H    ; Initialize P1 (all pins low)

LOOP:
    CPL P1.0        ; Toggle P1.0 (LED connected to this pin)
    ACALL DELAY_50MS ; Call 50ms delay subroutine
    SJMP LOOP       ; Loop forever

; --- Subroutine for 1ms delay using Timer 0 ---
DELAY_1MS:
    MOV TMOD, #01H  ; Set Timer 0 in Mode 1 (16-bit timer)
    MOV TH0, #0FCH  ; Load high byte (initial value for 1ms)
    MOV TL0, #018H  ; Load low byte (FC18H = 64536)
    SETB TR0        ; Start Timer 0

WAIT_1MS:
    JNB TF0, WAIT_1MS ; Wait until timer overflows
    CLR TR0         ; Stop Timer 0
    CLR TF0         ; Clear Timer 0 overflow flag
    RET             ; Return from subroutine

; --- Subroutine for 15ms delay (calls 1ms delay 15 times) ---
DELAY_15MS:
    MOV R7, #0FH    ; Load counter for 15 iterations

REPEAT_15MS:
    ACALL DELAY_1MS ; Call 1ms delay
    DJNZ R7, REPEAT_15MS ; Repeat 15 times
    RET             ; Return from subroutine

; --- Subroutine for 150ms delay (calls 15ms delay 10 times) ---
DELAY_150MS:
    MOV R6, #0AH    ; Load counter for 10 iterations

REPEAT_150MS:
    ACALL DELAY_15MS ; Call 15ms delay
    DJNZ R6, REPEAT_150MS ; Repeat 10 times
    RET             ; Return from subroutine

; --- Subroutine for 50ms delay (calls 15ms delay 5 times) ---
DELAY_50MS:
    MOV R5, #05H    ; Load counter for 5 iterations

REPEAT_50MS:
    ACALL DELAY_15MS ; Call 15ms delay
    DJNZ R5, REPEAT_50MS ; Repeat 5 times
    RET             ; Return from subroutine

END                 ; End of program