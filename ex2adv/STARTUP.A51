ORG 00H ; start address is 00H
MOV DPTR, #TABLE ; DPTR point to TABLE
START: MOV R0, #4 ; 4 LED
MOV R1, #0 ; table index
MOV R2, #0FEH ; LED drive pin(c0~c3)
LOOP: MOV P2, R2 ; select LED
MOV A, R1 ; move R1 to A
MOVC A, @A+DPTR ; get value from table
MOV P1, A ; move value to P1
CALL DELAY ; delay 0.5 ms
INC R1 ; increase R1
MOV A, R2 ; move R2 to A
RL A ; rotate A
MOV R2, A ; move A back to R2
DJNZ R0, LOOP ; decrement R0 until 0
SJMP START ; jump to start


DELAY: MOV R4, #4 ; loop 4 times
LOOP1: MOV R5, #250 ; loop 250 times
LOOP2: MOV R6, #250 ; loop 250 times
DJNZ R6, $ ; decrement R2 until 0
DJNZ R5, LOOP2 ; decrement R1 until 0
DJNZ R4, LOOP1 ; decrement R0 until 0
RET ; return from subroutine

TABLE: DB 083H ; 0
DB 0A4H ; 1
DB 0F9H ; 2
DB 083H ; 3
END ; end of program