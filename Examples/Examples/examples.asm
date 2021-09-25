.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
nums DWORD 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h

.code
main PROC
	call addFourNumbers
	call getFibonacciOf7
	call reverseArray

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

reverseArray:
	mov		eax, 0	; front pointer
	mov		ebx, offset [LENGTHOF nums * TYPE nums - TYPE nums]	; back pointer
	mov		ecx, offset [LENGTHOF nums / 2]
	mov		edx, 0	; holds front value
	mov		esi, 0	; holds back value

reverse:
	mov		edx, [nums + eax]
	mov		esi, [nums + ebx]
	mov		[nums + eax], esi
	mov		[nums + ebx], edx

	add		eax, TYPE nums
	sub		ebx, TYPE nums
	loop	reverse

	ret

main ENDP
END main