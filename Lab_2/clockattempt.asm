; ISR_example.asm: a) Increments/decrements a BCD variable every half second using
; an ISR for timer 2; b) Generates a 2kHz square wave at pin P1.1 using
; an ISR for timer 0; and c) in the 'main' loop it displays the variable
; incremented/decremented using the ISR for timer 2 on the LCD.  Also resets it to 
; zero if the 'BOOT' pushbutton connected to P4.5 is pressed.
$NOLIST
$MODLP51
$LIST

; There is a couple of typos in MODLP51 in the definition of the timer 0/1 reload
; special function registers (SFRs), so:

CLK           EQU 22118400 ; Microcontroller system crystal frequency in Hz
TIMER0_RATE   EQU 4096     ; 2048Hz squarewave (peak amplitude of CEM-1203 speaker)
TIMER0_RELOAD EQU ((65536-(CLK/TIMER0_RATE)))
TIMER2_RATE   EQU 500     ; 1000Hz, for a timer tick of 1ms
TIMER2_RELOAD EQU ((65536-(CLK/TIMER2_RATE)))

SOUND_OUT equ P1.1

secButton equ P0.0
minButton equ P0.3
hrsButton equ P0.6

aOnoff equ P4.5
aButton equ P2.4

; Reset vector
org 0x0000
    ljmp main

; External interrupt 0 vector (not used in this code)
org 0x0003
	reti

; Timer/Counter 0 overflow interrupt vector
org 0x000B
	ljmp Timer0_ISR

; External interrupt 1 vector (not used in this code)
org 0x0013
	reti

; Timer/Counter 1 overflow interrupt vector (not used in this code)
org 0x001B
	reti

; Serial port receive/transmit interrupt vector (not used in this code)
org 0x0023 
	reti
	
; Timer/Counter 2 overflow interrupt vector
org 0x002B
	ljmp Timer2_ISR

; In the 8051 we can define direct access variables starting at location 0x30 up to location 0x7F
dseg at 0x30 ;ds defines how many bytes we want to allocate 
Count1ms:     ds 2 ; Used to determine when half second has passed
BCD_counter:  ds 1 ; The BCD counter incrememted in the ISR and displayed in the main loop
secCount:	  ds 1 ; Increments second 
minCount:	  ds 1 
HrsCount: 	  ds 1
alarmHrs:     ds 1 ;keeps track of the hrs in the alarm portion
alarmMin:     ds 1 ;keeps track of the mins in the alarm portion

; In the 8051 we have variables that are 1-bit in size.  We can use the setb, clr, jb, and jnb
; instructions with these variables.  This is how you define a 1-bit variable:
bseg
half_seconds_flag: dbit 1 ; Set to one in the ISR every time 500 ms had passed
updateHr: dbit 1
updateSc: dbit 1
updateMn: dbit 1
ampmflag: dbit 1
alarmampmflag: dbit 0
ampmButtonflag: dbit 1
timerToggle: dbit 1
alarmEqual: dbit 0
cseg
; These 'equ' must match the hardware wiring
LCD_RS equ P3.2
;LCD_RW equ PX.X ; Not used in this code, connect the pin to GND
LCD_E  equ P3.3
LCD_D4 equ P3.4
LCD_D5 equ P3.5
LCD_D6 equ P3.6
LCD_D7 equ P3.7



$NOLIST
$include(LCD_4bit.inc) ; A library of LCD related functions and utility macros
$LIST

;                     1234567890123456    <- This helps determine the location of the counter
Initial_Message:  db 'Time   xx:xx:xxx' , 0
Alarm_View     :  db 'Alarm xx:xx  xx', 0
on: db 'on ',0
off: db 'off',0


;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 0                     ;
;---------------------------------;
Timer0_Init:
	mov a, TMOD
	anl a, #0xf0 ; Clear the bits for timer 0
	orl a, #0x01 ; Configure timer 0 as 16-timer
	mov TMOD, a
	mov TH0, #high(TIMER0_RELOAD)
	mov TL0, #low(TIMER0_RELOAD)
	; Set autoreload value
	mov RH0, #high(TIMER0_RELOAD)
	mov RL0, #low(TIMER0_RELOAD)
	; Enable the timer and interrupts
    clr ET0  ; Enable timer 0 interrupt
    setb TR0  ; Start timer 0

	ret

;---------------------------------;
; ISR for timer 0.  Set to execute;
; every 1/4096Hz to generate a    ;
; 2048 Hz square wave at pin P1.1 ;
;---------------------------------;
Timer0_ISR:
	;clr TF0  ; According to the data sheet this is done for us already.
	cpl SOUND_OUT ; Connect speaker to P1.1!
	reti

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 2                     ;
;---------------------------------;
Timer2_Init:
	mov T2CON, #0 ; Stop timer/counter.  Autoreload mode.
	mov TH2, #high(TIMER2_RELOAD)
	mov TL2, #low(TIMER2_RELOAD)
	; Set the reload value
	mov RCAP2H, #high(TIMER2_RELOAD)
	mov RCAP2L, #low(TIMER2_RELOAD)
	; Init One millisecond interrupt counter.  It is a 16-bit variable made with two 8-bit parts
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Enable the timer and interrupts
    setb ET2  ; Enable timer 2 interrupt
    setb TR2  ; Enable timer 2
    
	ret

;---------------------------------;
; ISR for timer 2                 ;
;---------------------------------;
Timer2_ISR:
	clr TF2  ; Timer 2 doesn't clear TF2 automatically. Do it in ISR

	cpl P1.0 ; To check the interrupt rate with oscilloscope. It must be precisely a 1 ms pulse.
	
	; The two registers used in the ISR must be saved in the stack
	push acc
	push psw
	
	; Increment the 16-bit one mili second counter
	inc Count1ms+0    ; Increment the low 8-bits first
	mov a, Count1ms+0 ; If the low 8-bits overflow, then increment high 8-bits
	jnz Inc_Done
	inc Count1ms+1
	sjmp Inc_Done
addSecond:
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	mov a, BCD_counter ;increment counter
	add a, #0x01
	sjmp Timer2_ISR_da
	
Inc_Done:
	; Check if half second has passed
	mov a, Count1ms+0
	cjne a, #low(500), Timer2_ISR_done ; Warning: this instruction changes the carry flag!
	mov a, Count1ms+1
	cjne a, #high(500), Timer2_ISR_done ; 500 milliseconds have passed.  Set a flag so the main program knows
	setb half_seconds_flag ; Let the main program know half second had passed
	cpl TR0 ; Enable/disable timer/counter 0. This line creates a beep-silence-beep-silence sound.
	sjmp addSecond	

Timer2_ISR_da:
	da a ; Decimal adjust instruction.  Check datasheet for more details!
	mov BCD_counter, a
	Set_Cursor(1, 14)     
	Display_BCD(BCD_counter)
	cjne a,#0x60,Timer2_ISR_done ;checks to see if the seconds reach 59
	
setSec: ;resets the seconds to 0 once 59
	mov a,#0x00
	da a 
	mov BCD_counter, a
	setb updateMn
	mov a, updateMn
	cjne a,#0x60,setMin ;checks to see if we need to increment the minute 
	Set_Cursor(1, 14)     
	Display_BCD(BCD_counter)

setMin:
	mov a,minCount
	add a,#0x01
	da a 
	mov minCount, a 
	Set_Cursor(1,11)
	display_BCD(minCount)
	cjne a,#0x60,Timer2_ISR_done ;checks for 60 seconds 
	mov minCount,#0x00
	Set_Cursor(1,11)
	display_BCD(minCount)
	ljmp setHrs

Timer2_ISR_done:
	pop psw
	pop acc
	reti
	
setHrs:
	mov a,hrsCount
	add a,#0x01 ;adds 1 to the time 
	da a 
	mov hrsCount, a ;setting value of a into hrsCount
	Set_Cursor(1,8)
	display_BCD(hrsCount)
	cjne a,#0x12,setHrs2 ;if time is not 12, then it will continue on to the next line 
	cpl ampmflag ;sets the ampmflag to 1 if we want to print P, otherwise print A
	jb ampmflag,ampmPrintP 
	Set_Cursor(1,8)
	display_BCD(hrsCount)
	Set_Cursor(1,16)
	Display_char(#'A')
	ljmp setHrs2

setHrs2:
	cjne a,#0x13,Timer2_ISR_done
	mov hrsCount, #0x01
	Set_Cursor(1,8)
	display_BCD(hrsCount)
	ljmp Inc_Done
	
ampmPrintP:
	Set_Cursor(1,16)
	Display_char(#'P')
	Set_Cursor(1,8)
	display_BCD(hrsCount)
	ljmp setHrs2
	

secUpdate:
	cpl updateSc
	lcall addSecond
	ret
minUpdate:
	lcall setMin
	ret
hrsUpdate:
	lcall setHrs
	ret
	


onOffUpdate:
	jb ampmButtonflag,printOn ;0 is off
	clr ET0
	Set_Cursor(2,14)
	Send_Constant_String(#off)
	ljmp secbut

	

printOn:
	Set_Cursor(2,14)
	Send_Constant_String(#on)
	ljmp secbut
	
alarmampmPrintP:
	Set_Cursor(2,12)
	Display_char(#'P')
	ljmp alarmHrSet2	
	
alarmHrSet:
	jb hrsButton, alarmMinSet ;hrsbutton at #P0.6
	Wait_Milli_Seconds(#50)
	jb hrsButton, alarmMinSet	
	jnb hrsButton, $
	mov a,alarmHrs
	add a, #0x01
	da a 
	mov alarmHrs,a
	Set_Cursor(2,7)
	display_BCD(alarmHrs)
	cjne a ,#0x12,alarmHrSet2
	cpl alarmampmflag
	jb alarmampmflag, alarmampmPrintP ;output P only when alarmampmflag is 1 otherwise print 0
	Set_Cursor(2,12)
	Display_char(#'A')
	sjmp alarmHrSet2
alarmOn:
	jb aButton, alarmHrSet
	Wait_Milli_Seconds(#50)
	jb aButton, alarmHrSet
	jnb aButton, $
	cpl timerToggle
	ret

alarmHrSet2:
	cjne a,#0x13,alarmOn 
	mov alarmHrs,#0x01
	Set_Cursor(2,7)
	display_BCD(alarmHrs)
	ljmp alarmOn
		
alarmMinSet:
	jb minButton, alarmOn ;minbutton at #p0.3
	Wait_Milli_Seconds(#50)
	jb minButton, alarmOn	
	jnb minButton, $
	mov a,alarmMin
	add a, #0x01
	da a 
	mov alarmMin, a
	Set_Cursor(2,10)
	display_BCD(alarmMin)
	cjne a,#0x60,alarmOn
	mov alarmMin, #0x00
	Set_Cursor(2,10)
	display_BCD(alarmMin)
	ljmp alarmOn
	

;---------------------------------;
; Main program. Includes hardware ;
; initialization and 'forever'    ;
; loop.                           ;
;---------------------------------;
main:
	; Initialization
    mov SP, #0x7F
    lcall Timer0_Init
    lcall Timer2_Init
    ; In case you decide to use the pins of P0, configure the port in bidirectional mode:
    mov P0M0, #0
    mov P0M1, #0
    setb EA   ; Enable Global interrupts
    lcall LCD_4BIT
    ; For convenience a few handy macros are included in 'LCD_4bit.inc':
	Set_Cursor(1, 1)
    Send_Constant_String(#Initial_Message)
    Set_Cursor(2,1)
    Send_Constant_String(#Alarm_View)
    setb half_seconds_flag
	mov BCD_counter, #0x00
	mov minCount, #0x00
	mov hrsCount, #0x12
	mov alarmHrs, #0x12
	mov alarmMin, #0x00
	ljmp loop
	; After initialization the program stays in this 'forever' loop
secbut:
	jb secButton, minbut ;secButton at P0.0
	Wait_Milli_Seconds(#50)
	jb secButton, minbut	
	jnb secButton, $
	lcall secUpdate
	ljmp minbut
alarmBuzzer2:
	setb ET0
	ljmp loop_c
alarmBuzzer:
	mov a, hrsCount
	da a 
	cjne a,alarmHrs, loop_c
	mov a, minCount
	da a 
	cjne a,alarmMin, loop_c
	mov a, ampmflag
	da a 
	cjne a,alarmampmflag,alarmBuzzer2
	ljmp loop_c
	
	
loop:
	jb aOnOff, secbut  ; if the 'BOOT' button is not pressed skip  , button at p4.5
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb aOnOff, secbut  ; if the 'BOOT' button is not pressed skip
	jnb aOnOff, $
	cpl ampmButtonflag
	ljmp onOffUpdate	
	;ljmp secbut	; Wait for button release.  The '$' means: jump to same instruction.
	; A valid press of the 'BOOT' button has been detected, reset the BCD counter.
	; But first stop timer 2 and reset the milli-seconds counter, to resync everything.
minbut:	
	jb minButton, hrsbut ;minbutton at #p0.3
	Wait_Milli_Seconds(#50)
	jb minButton, hrsbut	
	jnb minButton, $
	lcall minUpdate
hrsbut:
	jb hrsButton, timeSwap ;hrsbutton at #P0.6
	Wait_Milli_Seconds(#50)
	jb hrsButton, timeSwap	
	jnb hrsButton, $
	lcall hrsUpdate
timeSwap:
	jb aButton, loop_a
	Wait_Milli_Seconds(#50)
	jb aButton, loop_a
	jnb aButton, $
	lcall alarmOn
loop_a:
	jb ampmButtonflag,alarmBuzzer ;checks if we need to turn on the alarm
	sjmp loop_c
loop_c:
	jnb half_seconds_flag, loop
loop_b:
    clr half_seconds_flag ; We clear this flag in the main loop, but it is set in the ISR for timer 2
	Set_Cursor(1, 14)     ; the place in the LCD where we want the BCD counter value
	Display_BCD(BCD_counter) ; This macro is also in 'LCD_4bit.inc'
	Set_Cursor(1,8)
	display_BCD(hrsCount)
	Set_Cursor(1,11)
	display_BCD(minCount)
	Set_Cursor(2,7)
	display_BCD(alarmHrs)
	Set_Cursor(2,10)
	display_BCD(alarmMin)
    ljmp loop
END
