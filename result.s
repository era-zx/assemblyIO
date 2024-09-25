.section .data # declare data section with results strings
	zero_result_string: .asciz "This program was successful!\n" # ascii zero byte terminated string, length: 29
	non_zero_result_string: .asciz "This program was unsuccessful.\n" #length 31

.section .bss
	.lcomm in_buffer, 2 # only 1 byte of input tested for demo along w 1 byte newline from stdin

.section .text
	.globl _start # mark program entry via text section

_start: # mark start point of the executable code
	movl $3, %eax # move the "read" sys call of 4 to register eax
	movl $0, %ebx # move linux stin of 1 to ebx register
	leal in_buffer, %ecx #move our buffer address to the ecx register
	movl $2, %edx # read 2 bytes of buffer
	int $0x80 # trigger OS interrupt as ready to read

	#input comparison
	cmpb $48, in_buffer #compare the ascii char value of '0'. 48 in immediate decimal. if (buffer high-byte == 00110000(aka 48)) { zero_flag = true }
	je input_zero #if (zero_flag) { zero_flag = false; jump to is zero label; }

#input non-zero
	movl $4, %eax # load write
	movl $1, %ebx # load stdout
	movl $non_zero_result_string, %ecx # load not zero result string
	movl $31, %edx # not zero string length
	int $0x80 # OS interrupt
	jmp exit_procedure # always jump to exit label

input_zero:
	movl $4, %eax
	movl $1, %ebx
	movl $zero_result_string, %ecx # load is zero result characters
	movl $29, %edx
	int $0x80

exit_procedure:
	movl $1, %eax # move linux exit 1 to eax register
	xorl %ebx, %ebx # xor ebx register with itself to return 0
	int $0x80 # trigger OS interrupt to exit
