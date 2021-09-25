.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
	call addFourNumbers
	call getFibonacciOf7

	INVOKE ExitProcess,0

addFourNumbers:
; Calculate the sum of four integer values assigned to general-purpose registers. 
	mov		eax, 1
	mov		ebx, 2
	mov		ecx, 3
	mov		edx, 4
	
	add		ecx, edx
	add		ebx, ecx
	add		eax, ebx

	ret

getFibonacciOf7:
; Calculate the fibonacci of 7 
	mov		ecx, 7 ; ecx automatically decrements when loop is called
	mov		eax, 0
	mov		ebx, 1
	mov		edx, 0
	mov		esi, 0

	fibonacci:
		mov		esi, ebx
		add		esi, edx
		mov		eax, esi
		mov		edx, ebx
		mov		ebx, eax
		loop	fibonacci

	ret
main ENDP
END main