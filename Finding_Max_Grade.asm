section .data
section .bss
section .text
	global FindMax

FindMax:
	mov esi, 0x10000     ; Set the starting address of the student records in esi, 0x is used for hexadecimal
	mov a5, esi         ; Store the starting address in a5
	mov bl, byte [esi+10]  ; Load the module mark of the first student record into bl

; Byte used to access each byte

; Loop for finding the max among the marks
compare_loop:
	add esi, 12         ; Move to the next student record, 12 because of 12 bytes in one
	mov dl, byte [esi+10]  ; Move the module mark of the current student record into dl
	cmp dl, bl          ; Compare the mark with the highest mark found so far (bl)
	jg greater          ; If dl > bl, jump to greater

	cmp esi, 0xFFFF      ; Check if it is the end address
	je exit              ; If so, return and exit

	jmp compare_loop    ; Continue the loop

greater:
	mov bl, dl           ; Update the highest mark (bl) to the current mark (dl)
	mov a5, esi         ; Update the address of the highest marked record in a5

	cmp esi, 0xFFFF      ; Check if it is the end address
	je exit              ; If so, return and exit

	jmp compare_loop    ; Continue the loop

exit:
	ret

