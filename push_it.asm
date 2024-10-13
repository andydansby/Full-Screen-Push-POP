	org $8020
push_pop:

	ld BC, 0000
	; uses the B register to calculate pixel row
	push BC		;save to stack for when we update the loop


	ld IX, $4000 + $10
	;since Data is pushed to the screen in backwards order
    ; and we can only move $10 bytes at a time
    ; we start with the scren data + $10

	ld IY, data
	;iy holds our buffer data
	; start at the beginning of DATA

	;I of IR is going to be our loop data
	ld A, 192   ; there are 192 lines in a ZX Spectrum display
	ld I, A

	;so at this point
	;IX is holding the screen address
	;IY is holding out image buffer
	;I (of IR) is holding our loop info

	;lets save our original stack
	ld (originalStack), sp

loop:

;each loop, we need to push 32 columns, but only 16 at a time

; sp = #5FE4
	ld sp, IY; 		10t
	;our stack is set to image buffer
	;== 10 t-states

	;move 16 bytes from front to back
	;pop moves stack pointer forward
	pop AF	;2 bytes
	pop BC	;4 bytes
	pop DE	;6 bytes
	pop HL	;8 bytes
	exx
	ex AF, AF'
	pop AF	;10 bytes
	pop BC	;12 bytes
	pop DE	;14 bytes
	pop HL	;16 bytes
	;16 Bytes in total


	ld sp, IX; 		10t
	;== 10 t-states

	;push moves stack pointer backwards
	; push 16 bytes from front to back
	push HL	;16 bytes
	push DE	;14 bytes
	push BC	;12 bytes
	push AF	;10 bytes
	exx
	ex AF, AF'
	push HL	;8 bytes
	push DE	;6 bytes
	push BC	;4 bytes
	push AF	;2 bytes
    ;16 bytes moved so far
    ;need to move another 16


    ;iy needs to increase by 16
    ;ix needs to increase by 16
    ld BC, $10;load 16
    add IX, BC;ix is 4020
    ;adjust our buffer
    add IY, BC;iy = #C010
    ld sp, IY; 		10t

    ;move 16 bytes from front to back
	;pop moves stack pointer forward
	pop AF	;2 bytes
	pop BC	;4 bytes
	pop DE	;6 bytes
	pop HL	;8 bytes
	exx
	ex AF, AF'
	pop AF	;10 bytes
	pop BC	;12 bytes
	pop DE	;14 bytes
	pop HL	;16 bytes
    ;16 Bytes in total

	ld sp, IX; 		10t
	;== 10 t-states

	;push moves stack pointer backwards
	; push 16 bytes from front to back
	push HL	;16 bytes
	push DE	;14 bytes
	push BC	;12 bytes
	push AF	;10 bytes
	exx
	ex AF, AF'
	push HL	;8 bytes
	push DE	;6 bytes
	push BC	;4 bytes
	push AF	;2 bytes
; 1 full line has been copied

    ld BC, $10;load 16
    add IX, BC;ix is 4020
    ;adjust our buffer
    add IY, BC;iy = #C010
    ;ld sp, iy; 		10t

;loop around


	ld A, I					;9t
	dec A					;4t
	ld I, A					;9t

	jp nz, loop				;

;;;;;;;;;;;;;;;;


    ;restore original stack
    ld sp, (originalStack)
    ;sp = #5FE6


    ;restore the BC register that we used to count the loop
	pop BC

;stop:
;   jp stop






;$806A
;;;;;;;;;;;;;;
;   stop
;;;;;;;;;;;;;;
;stop:
;    jp stop
;;;;;;;;;;;;;;
;   stop
;;;;;;;;;;;;;;



ret
