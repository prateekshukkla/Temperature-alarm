ORG 0000H

LJMP MAIN

ORG 30H

 MAIN:

REC:; ADC

CLR P2.6;clearing p2.6

SETB P2.6;generating square wave

HERE: JNB P2.7, HERE; loop

CLR P2.5;clearing p2.5

MOV A, Pl;moving from pl to a

 SETB P2.5; setting p2.5-1

 CHECK_TEMPERATURE:
 CJNE A, #100B, TEMPERATURE LOW; comparing the bit with given temperature

 SETB P3.3; switch ON the LED
 LCALL FHFJHD; calling the function
 SJMP REC;in a loop until it is true

 TEMPERATURE_LOW:
 CLR P3.3; switch OFF the led

 LCALL FHFJHD

 SJMP REC;in the loop until it's true
 FHFJHD:MOV RO, #255;loop can iterate upto 256 times
HERE2: MOV R1, #255;loop can iterate upto 256 times
 HEREI: DJNZ R1, HERE1; decrement R1
 DJNZ RO, HERE2; Decrement RO
 RET
 END