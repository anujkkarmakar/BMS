	.file	"Main.c"
	.text
	.section .rdata,"dr"
LC0:
	.ascii "cls\0"
	.text
	.globl	_clearscr
	.def	_clearscr;	.scl	2;	.type	32;	.endef
_clearscr:
LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_system
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.globl	_SetColor
	.def	_SetColor;	.scl	2;	.type	32;	.endef
_SetColor:
LFB36:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$-11, (%esp)
	call	_GetStdHandle@4
	subl	$4, %esp
	movl	%eax, -12(%ebp)
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetConsoleScreenBufferInfo@8
	subl	$8, %esp
	testl	%eax, %eax
	je	L5
	movzwl	-28(%ebp), %eax
	andw	$240, %ax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	andl	$15, %eax
	orl	%edx, %eax
	movw	%ax, -14(%ebp)
	movzwl	-14(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_SetConsoleTextAttribute@8
	subl	$8, %esp
	nop
L5:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.comm	_LL, 44, 5
	.comm	_ACC, 96, 5
	.comm	_CD, 4, 2
	.comm	_PT, 8, 2
	.comm	_LD, 16, 2
	.section .rdata,"dr"
LC1:
	.ascii "rb\0"
LC2:
	.ascii "List\0"
	.align 4
LC3:
	.ascii "\12The database is either deleted or cannot be found.\12\12Please contact the bank employee. Toll Number: 1800 000 1234\0"
LC4:
	.ascii "\12Customer Number: %d\0"
LC5:
	.ascii "\12Name: %s\0"
LC6:
	.ascii "\12Mobile Number: %ld\0"
LC7:
	.ascii "\12Account Number: %ld\0"
LC8:
	.ascii "\12I.D. Number: %ld\0"
LC9:
	.ascii "\12Age: %d\0"
LC10:
	.ascii "Savings\0"
LC11:
	.ascii "Current\0"
LC12:
	.ascii "\12Type of account: %s\0"
LC13:
	.ascii "\12Account balance: Rs. %.2f\0"
	.align 4
LC14:
	.ascii "\12\12Total number of accounts blocked = %d\0"
	.align 4
LC15:
	.ascii "\12Press any key to terminate the session...\0"
	.text
	.globl	_viewAccountsBlocked
	.def	_viewAccountsBlocked;	.scl	2;	.type	32;	.endef
_viewAccountsBlocked:
LFB37:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$1, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	call	_clearscr
	movl	$10, (%esp)
	call	_putchar
	cmpl	$0, -16(%ebp)
	jne	L9
	movl	$LC3, (%esp)
	call	_puts
	jmp	L6
L12:
	movzbl	_ACC+84, %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L9
	movl	$10, (%esp)
	call	_putchar
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	$_ACC, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	_ACC+68, %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	_ACC+20, %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	_ACC+36, %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	_ACC+40, %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	movzbl	_ACC+76, %eax
	cmpb	$83, %al
	jne	L10
	movl	$LC10, %eax
	jmp	L11
L10:
	movl	$LC11, %eax
L11:
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	flds	_ACC+72
	fstpl	4(%esp)
	movl	$LC13, (%esp)
	call	_printf
L9:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L12
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC15, (%esp)
	call	_printf
	call	_getch
L6:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
	.section .rdata,"dr"
LC17:
	.ascii "wb\0"
LC18:
	.ascii "Listtemp\0"
LC19:
	.ascii "AccountDeletion\0"
	.align 4
LC20:
	.ascii "\12The database is either deleted or cannot be found.\12\11OR\12There might be no account deletion request\12\12Please contact the bank technical support team. Toll Number: 1800 000 1234\0"
	.text
	.globl	_closeAccountRequest
	.def	_closeAccountRequest;	.scl	2;	.type	32;	.endef
_closeAccountRequest:
LFB38:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC19, (%esp)
	call	_fopen
	movl	%eax, -24(%ebp)
	cmpl	$0, -16(%ebp)
	je	L14
	cmpl	$0, -20(%ebp)
	je	L14
	cmpl	$0, -24(%ebp)
	jne	L16
L14:
	movl	$LC20, (%esp)
	call	_puts
	call	_getch
	movl	$1, (%esp)
	call	_exit
L18:
	movl	_ACC+20, %edx
	movl	_CD, %eax
	cmpl	%eax, %edx
	jne	L17
	movl	$1, -12(%ebp)
L17:
	movl	-24(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$4, 4(%esp)
	movl	$_CD, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L18
	cmpl	$1, -12(%ebp)
	jne	L19
	movl	$0, -12(%ebp)
	jmp	L20
L19:
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
L20:
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_rewind
L16:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L17
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC19, (%esp)
	call	_remove
	movl	$LC2, (%esp)
	call	_remove
	movl	$LC2, 4(%esp)
	movl	$LC18, (%esp)
	call	_rename
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE38:
	.section .rdata,"dr"
LC21:
	.ascii "\12Transaction Details:\12\0"
	.align 4
LC22:
	.ascii "====================================================================================================================\0"
	.align 4
LC23:
	.ascii "#\11Time\11\11Date\11\11\11From\11\11To\11Type\11\11Old Balance\11New Balance\0"
	.text
	.globl	_printHeader
	.def	_printHeader;	.scl	2;	.type	32;	.endef
_printHeader:
LFB39:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC21, (%esp)
	call	_puts
	movl	$LC22, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	movl	$LC23, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	movl	$LC22, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE39:
	.section .rdata,"dr"
LC24:
	.ascii "Ledger\0"
LC25:
	.ascii "Deposit\0"
LC26:
	.ascii "Transfer\0"
LC27:
	.ascii "Withdraw\0"
	.align 4
LC28:
	.ascii "\12%d\11%02d:%02d:%02d\11%02d-%02d-%02d\11\11%ld\11\11%ld\11%s\11\11%.2f\11\11%.2f\0"
	.text
	.globl	_viewTransactions
	.def	_viewTransactions;	.scl	2;	.type	32;	.endef
_viewTransactions:
LFB40:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -28(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -32(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC24, (%esp)
	call	_fopen
	movl	%eax, -36(%ebp)
	jmp	L24
L31:
	movl	_LL+28, %eax
	cmpl	%eax, 8(%ebp)
	je	L25
	movl	_LL+24, %eax
	cmpl	%eax, 8(%ebp)
	jne	L24
L25:
	cmpl	$0, -28(%ebp)
	jne	L26
	call	_printHeader
L26:
	flds	_LL+40
	flds	_LL+36
	movzbl	_LL+32, %eax
	cmpb	$87, %al
	je	L27
	movzbl	_LL+32, %eax
	cmpb	$68, %al
	jne	L28
	fxch	%st(1)
	movl	$LC25, %eax
	jmp	L30
L28:
	fxch	%st(1)
	movl	$LC26, %eax
	jmp	L30
L27:
	fxch	%st(1)
	movl	$LC27, %eax
L30:
	movl	_LL+28, %ebx
	movl	_LL+24, %edx
	movl	%edx, -44(%ebp)
	movl	_LL+8, %ecx
	movl	%ecx, -48(%ebp)
	movl	_LL+4, %esi
	movl	%esi, -52(%ebp)
	movl	_LL, %edi
	movl	_LL+12, %esi
	movl	_LL+16, %ecx
	movl	_LL+20, %edx
	addl	$1, -28(%ebp)
	fstpl	56(%esp)
	fstpl	48(%esp)
	movl	%eax, 44(%esp)
	movl	%ebx, 40(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	%edi, 24(%esp)
	movl	%esi, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC28, 4(%esp)
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, (%esp)
	call	_fprintf
L24:
	movl	-36(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$44, 4(%esp)
	movl	$_LL, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L31
	nop
	nop
	addl	$108, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE40:
	.section .rdata,"dr"
LC29:
	.ascii "\12Enter your account number: \0"
LC30:
	.ascii "%ld\0"
	.align 4
LC31:
	.ascii "\12Enter the password. Press 'spacebar' to input\12Enter: \0"
	.align 4
LC32:
	.ascii "\12You have reached the limit of entering the password. Request to view your account details is denied!\0"
	.align 4
LC33:
	.ascii "\12\12Press any key to continue...\0"
	.text
	.globl	_checkAccountDetails
	.def	_checkAccountDetails;	.scl	2;	.type	32;	.endef
_checkAccountDetails:
LFB41:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -16(%ebp)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, -20(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jne	L33
	movl	$LC3, (%esp)
	call	_puts
	jmp	L32
L33:
	movl	$LC29, (%esp)
	call	_printf
	leal	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	jmp	L35
L44:
	movl	_ACC+20, %edx
	movl	-40(%ebp), %eax
	cmpl	%eax, %edx
	jne	L35
	nop
L36:
	movl	$0, -12(%ebp)
	movl	$LC0, (%esp)
	call	_system
	movl	$LC31, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
	jmp	L37
L38:
	movl	-12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movzbl	-25(%ebp), %eax
	movb	%al, (%edx)
	addl	$1, -12(%ebp)
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 4(%esp)
	movl	$42, (%esp)
	call	_fputc
L37:
	call	_getch
	movb	%al, -25(%ebp)
	cmpb	$32, -25(%ebp)
	jne	L38
	movl	$10, (%esp)
	call	_putchar
	movl	-12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$_ACC+44, (%esp)
	call	_strcmp
	movl	%eax, -32(%ebp)
	cmpl	$0, -32(%ebp)
	je	L39
	cmpl	$2, -16(%ebp)
	jg	L39
	jmp	L36
L39:
	movl	-20(%ebp), %eax
	movl	%eax, -36(%ebp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	___mingw_free
	nop
	cmpl	$3, -16(%ebp)
	jne	L40
	movl	$LC0, (%esp)
	call	_system
	movl	$LC32, (%esp)
	call	_printf
	jmp	L35
L40:
	movl	$10, (%esp)
	call	_putchar
	movl	$_ACC, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	_ACC+68, %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	_ACC+20, %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	_ACC+36, %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	_ACC+40, %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	movzbl	_ACC+76, %eax
	cmpb	$83, %al
	jne	L41
	movl	$LC10, %eax
	jmp	L42
L41:
	movl	$LC11, %eax
L42:
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	flds	_ACC+72
	fstpl	4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movl	_ACC+20, %eax
	movl	%eax, (%esp)
	call	_viewTransactions
	jmp	L43
L35:
	movl	-24(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L44
L43:
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
L32:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE41:
	.section .rdata,"dr"
LC34:
	.ascii "ab\0"
LC35:
	.ascii "\12\0"
	.align 4
LC36:
	.ascii "\11Welcome Onboard! We are happy that you choose to bank with us\0"
LC37:
	.ascii "\12Enter your name: \0"
LC38:
	.ascii "%[^\12]s\0"
	.align 4
LC39:
	.ascii "\12Enter your govt. approved ID Number: \0"
LC40:
	.ascii "\12Mobile Number: \0"
	.align 4
LC41:
	.ascii "\12Enter your date of birth in DDMMYYYY format: \0"
LC42:
	.ascii "%s\0"
LC43:
	.ascii "\12Enter your age: \0"
LC44:
	.ascii "%d\0"
	.align 4
LC45:
	.ascii "\12Great, %s! Your personal details have been saved.\12We only need few more information before we setup your account\0"
	.align 4
LC46:
	.ascii "\12\12\12Which type of account would you open ?\0"
LC47:
	.ascii "\12"
	.ascii "1. Savings Account\0"
LC48:
	.ascii "\12"
	.ascii "2. Current Account\0"
LC49:
	.ascii "\12"
	.ascii "3. Fixed Deposit\0"
LC50:
	.ascii "\12"
	.ascii "4. Recurring Deposit\0"
	.align 4
LC51:
	.ascii "\12Enter the type of account to proceed: \0"
LC52:
	.ascii "Choice Invalid.\12\0"
	.align 4
LC53:
	.ascii "\12Setting up a password for your account can prevent unauthorise access.\0"
	.align 4
LC54:
	.ascii "\12Password must not contain any space, special characters. Allowed characters are: a-z, and 0-9. Maximum length allowed is 20\12\0"
LC55:
	.ascii "Enter password: \0"
LC56:
	.ascii "%[a-z,0-9]s\0"
	.align 4
LC57:
	.ascii "\12\12Please re-enter password correctly\0"
	.align 4
LC58:
	.ascii "\12Minimum initial investment required towards account opening is Rs. 1,000.00\0"
	.align 4
LC59:
	.ascii "\12Enter the amount you would wish to add: \0"
LC60:
	.ascii "%f\0"
	.align 4
LC62:
	.ascii "\12Please fund the account immediately.\0"
	.align 4
LC63:
	.ascii "\12Minimum initial investment required towards account opening is Rs. 2,000.00\0"
	.align 4
LC65:
	.ascii "\12Enter the option for the time period of investing: \0"
	.align 4
LC66:
	.ascii "\12Please enter the details correctly.\0"
	.align 4
LC67:
	.ascii "\12Minimum initial investment required towards account opening is Rs. 500.00\0"
	.align 4
LC69:
	.ascii "\12How was your experience with opening a new account(1-5)? \0"
	.align 4
LC70:
	.ascii "Wow! We are happy to know that you liked the process\12\0"
	.align 4
LC71:
	.ascii "Great buddy! We would love to hear where we went wrong\12\0"
	.align 4
LC72:
	.ascii "It seems that the process was cumbersome. Don't worry we'll strive better as always\12\0"
	.align 4
LC73:
	.ascii "We are sorry for the incovience caused. You can share the feedback with the bank employee\12\0"
	.align 4
LC74:
	.ascii "We are extremely sorry for provising you this service. You can share the feedback with the bank employee\12\0"
	.align 4
LC75:
	.ascii "\12Please do enter a valid number between 1 to 5: \0"
	.text
	.globl	_addNewAccount
	.def	_addNewAccount;	.scl	2;	.type	32;	.endef
_addNewAccount:
LFB42:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_time
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_localtime
	movl	%eax, -16(%ebp)
	movl	$LC34, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	movl	$LC34, 4(%esp)
	movl	$LC24, (%esp)
	call	_fopen
	movl	%eax, -24(%ebp)
	cmpl	$0, -20(%ebp)
	je	L46
	cmpl	$0, -24(%ebp)
	jne	L47
L46:
	movl	$LC3, (%esp)
	call	_puts
	jmp	L45
L47:
	movl	$LC35, (%esp)
	call	_puts
	movl	$4, (%esp)
	call	_SetColor
	movl	$LC36, (%esp)
	call	_puts
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$14, (%esp)
	call	_SetColor
	movl	$LC37, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_SetColor
	movl	$_ACC, 4(%esp)
	movl	$LC38, (%esp)
	call	_scanf
	movl	$14, (%esp)
	call	_SetColor
	movl	$LC39, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_SetColor
	movl	$_ACC+36, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	movl	$14, (%esp)
	call	_SetColor
	movl	$LC40, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_SetColor
	movl	$_ACC+68, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$14, (%esp)
	call	_SetColor
	movl	$LC41, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_SetColor
	movl	$_ACC+24, 4(%esp)
	movl	$LC42, (%esp)
	call	_scanf
	movl	$15, (%esp)
	call	_SetColor
L49:
	movl	$LC43, (%esp)
	call	_printf
	movl	$_ACC+40, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	_ACC+40, %eax
	testl	%eax, %eax
	jle	L49
	movl	_ACC+40, %eax
	cmpl	$100, %eax
	jle	L51
	jmp	L49
L51:
	movl	$_ACC, 4(%esp)
	movl	$LC45, (%esp)
	call	_printf
	movl	$LC46, (%esp)
	call	_printf
	movl	$LC47, (%esp)
	call	_printf
	movl	$LC48, (%esp)
	call	_printf
	movl	$LC49, (%esp)
	call	_printf
	movl	$LC50, (%esp)
	call	_printf
L58:
	movl	$LC51, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	leal	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	-32(%ebp), %eax
	cmpl	$4, %eax
	je	L52
	cmpl	$4, %eax
	jg	L53
	cmpl	$3, %eax
	je	L54
	cmpl	$3, %eax
	jg	L53
	cmpl	$1, %eax
	je	L55
	cmpl	$2, %eax
	je	L56
	jmp	L53
L55:
	movb	$83, _ACC+76
	jmp	L57
L56:
	movb	$67, _ACC+76
	jmp	L57
L54:
	movb	$70, _ACC+76
	jmp	L57
L52:
	movb	$82, _ACC+76
	jmp	L57
L53:
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 12(%esp)
	movl	$16, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC52, (%esp)
	call	_fwrite
	nop
L57:
	movl	-32(%ebp), %eax
	testl	%eax, %eax
	jle	L58
	movl	-32(%ebp), %eax
	cmpl	$4, %eax
	jg	L58
	movl	$LC53, (%esp)
	call	_puts
	movl	$LC54, (%esp)
	call	_puts
L60:
	movl	$1, (%esp)
	call	_SetColor
	movl	$LC55, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$3, (%esp)
	call	_SetColor
	movl	$_ACC+44, 4(%esp)
	movl	$LC56, (%esp)
	call	_scanf
	movl	$_ACC+44, (%esp)
	call	_strlen
	cmpl	$20, %eax
	jbe	L59
	movl	$4, (%esp)
	call	_SetColor
	movl	$LC57, (%esp)
	call	_puts
L59:
	movl	$15, (%esp)
	call	_SetColor
	movl	$_ACC+44, (%esp)
	call	_strlen
	cmpl	$20, %eax
	ja	L60
	movl	$LC29, (%esp)
	call	_printf
	movl	$_ACC+20, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	movl	-32(%ebp), %eax
	cmpl	$4, %eax
	je	L61
	cmpl	$4, %eax
	jg	L62
	cmpl	$3, %eax
	je	L63
	cmpl	$3, %eax
	jg	L62
	cmpl	$1, %eax
	je	L64
	cmpl	$2, %eax
	je	L65
	jmp	L62
L64:
	movl	$LC58, (%esp)
	call	_printf
	movl	$LC59, (%esp)
	call	_printf
	movl	$_ACC+72, 4(%esp)
	movl	$LC60, (%esp)
	call	_scanf
	flds	_ACC+72
	flds	LC61
	fcompp
	fnstsw	%ax
	sahf
	jbe	L95
	movl	$LC62, (%esp)
	call	_printf
	jmp	L64
L95:
	movl	$0, _ACC+80
	jmp	L62
L65:
	movl	$LC63, (%esp)
	call	_printf
	movl	$LC59, (%esp)
	call	_printf
	movl	$_ACC+72, 4(%esp)
	movl	$LC60, (%esp)
	call	_scanf
	flds	_ACC+72
	flds	LC64
	fcompp
	fnstsw	%ax
	sahf
	ja	L94
	jmp	L62
L94:
	movl	$LC62, (%esp)
	call	_printf
	jmp	L65
L63:
	call	_fixedDepositMenu
L70:
	movl	$LC58, (%esp)
	call	_printf
	movl	$LC59, (%esp)
	call	_printf
	movl	$_ACC+72, 4(%esp)
	movl	$LC60, (%esp)
	call	_scanf
	movl	$LC65, (%esp)
	call	_printf
	movl	$_ACC+80, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	flds	_ACC+72
	flds	LC61
	fcompp
	fnstsw	%ax
	sahf
	ja	L71
	movl	_ACC+80, %eax
	testl	%eax, %eax
	jle	L71
	movl	_ACC+80, %eax
	cmpl	$4, %eax
	jle	L72
L71:
	movl	$LC66, (%esp)
	call	_printf
	jmp	L70
L72:
	movl	_ACC+80, %eax
	cmpl	$1, %eax
	jne	L73
	movl	$0, _ACC+80
	jmp	L62
L73:
	movl	_ACC+80, %eax
	cmpl	$2, %eax
	jne	L75
	movl	$1, _ACC+80
	jmp	L62
L75:
	movl	_ACC+80, %eax
	cmpl	$3, %eax
	jne	L76
	movl	$2, _ACC+80
	jmp	L62
L76:
	movl	$3, _ACC+80
	jmp	L62
L61:
	call	_recurringDepositMenu
L77:
	movl	$LC67, (%esp)
	call	_printf
	movl	$LC59, (%esp)
	call	_printf
	movl	$_ACC+72, 4(%esp)
	movl	$LC60, (%esp)
	call	_scanf
	movl	$LC65, (%esp)
	call	_printf
	movl	$_ACC+80, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	flds	_ACC+72
	flds	LC68
	fcompp
	fnstsw	%ax
	sahf
	ja	L78
	movl	_ACC+80, %eax
	testl	%eax, %eax
	jle	L78
	movl	_ACC+80, %eax
	cmpl	$4, %eax
	jle	L79
L78:
	movl	$LC66, (%esp)
	call	_printf
	jmp	L77
L79:
	movl	_ACC+80, %eax
	cmpl	$1, %eax
	jne	L80
	movl	$0, _ACC+80
	jmp	L96
L80:
	movl	_ACC+80, %eax
	cmpl	$2, %eax
	jne	L82
	movl	$1, _ACC+80
	jmp	L96
L82:
	movl	_ACC+80, %eax
	cmpl	$3, %eax
	jne	L83
	movl	$2, _ACC+80
	jmp	L96
L83:
	movl	$3, _ACC+80
L96:
	nop
L62:
	movl	$LC69, (%esp)
	call	_printf
L92:
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	-28(%ebp), %eax
	cmpl	$5, %eax
	ja	L84
	movl	L86(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L86:
	.long	L84
	.long	L90
	.long	L89
	.long	L88
	.long	L87
	.long	L85
	.text
L85:
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 12(%esp)
	movl	$53, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC70, (%esp)
	call	_fwrite
	jmp	L91
L87:
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 12(%esp)
	movl	$55, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC71, (%esp)
	call	_fwrite
	jmp	L91
L88:
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 12(%esp)
	movl	$84, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC72, (%esp)
	call	_fwrite
	jmp	L91
L89:
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 12(%esp)
	movl	$90, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC73, (%esp)
	call	_fwrite
	jmp	L91
L90:
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 12(%esp)
	movl	$105, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC74, (%esp)
	call	_fwrite
	jmp	L91
L84:
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 12(%esp)
	movl	$48, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC75, (%esp)
	call	_fwrite
	nop
L91:
	movl	-28(%ebp), %eax
	testl	%eax, %eax
	jle	L92
	movl	-28(%ebp), %eax
	cmpl	$5, %eax
	jg	L92
	movb	$1, _ACC+84
	movb	$0, _ACC+85
	movl	_ACC+20, %eax
	movl	%eax, _LL+24
	flds	_ACC+72
	fstps	_LL+40
	movl	_ACC+20, %eax
	movl	%eax, _LL+28
	fldz
	fstps	_LL+36
	movb	$68, _LL+32
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, _LL+20
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, _LL
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, _LL+16
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, _LL+12
	movl	-16(%ebp), %eax
	movl	16(%eax), %eax
	addl	$1, %eax
	movl	%eax, _LL+4
	movl	-16(%ebp), %eax
	movl	20(%eax), %eax
	addl	$1900, %eax
	movl	%eax, _LL+8
	movl	-24(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$44, 4(%esp)
	movl	$_LL, (%esp)
	call	_fwrite
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
L45:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE42:
	.section .rdata,"dr"
	.align 4
LC77:
	.ascii "\12You have reached the limit of entering the password. Process terminated!\0"
	.align 4
LC78:
	.ascii "\12\12Press any key to terminate your session...\0"
	.align 4
LC79:
	.ascii "\12We are sorry %s to see you not liking our service\0"
	.align 4
LC80:
	.ascii "\12But you can still consider not closing your account as we are working to serve our customers better\0"
	.align 4
LC81:
	.ascii "\12Remember that this process cannot be reversed.\0"
	.align 4
LC82:
	.ascii "\12\12Do you still want to proceed (Y or N)? \0"
	.align 4
LC83:
	.ascii "\12Invalid choice. Please do enter a valid choice: \0"
	.align 4
LC84:
	.ascii "\12Your account deletion request is accepted. Your account will be delted with the next 48 hrs.\0"
	.align 4
LC85:
	.ascii "\12You will receive a confirmation SMS after your account has been closed.\0"
	.align 4
LC86:
	.ascii "\12Thank you for being our valuable customer :)\0"
	.align 4
LC87:
	.ascii "\12Sorry! No account found with account number %ld.\12Please try again next time.\0"
	.align 4
LC88:
	.ascii "Thank you for staying with us!\0"
LC89:
	.ascii "\12Press any key to continue...\0"
	.text
	.globl	_closeAccount
	.def	_closeAccount;	.scl	2;	.type	32;	.endef
_closeAccount:
LFB43:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	$0, -12(%ebp)
	movl	$-99, -16(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	$21, (%esp)
	call	_malloc
	movl	%eax, -28(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -32(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -36(%ebp)
	movl	$LC34, 4(%esp)
	movl	$LC19, (%esp)
	call	_fopen
	movl	%eax, -40(%ebp)
	cmpl	$0, -32(%ebp)
	je	L98
	cmpl	$0, -36(%ebp)
	je	L98
	cmpl	$0, -40(%ebp)
	jne	L99
L98:
	movl	$LC3, (%esp)
	call	_puts
	call	_getch
	jmp	L97
L99:
	movl	$LC29, (%esp)
	call	_printf
	leal	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	jmp	L101
L112:
	movl	_ACC+20, %edx
	movl	-52(%ebp), %eax
	cmpl	%eax, %edx
	jne	L101
	nop
L102:
	movl	$LC31, (%esp)
	call	_printf
	movl	$0, -24(%ebp)
	addl	$1, -20(%ebp)
	jmp	L103
L104:
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movzbl	-41(%ebp), %eax
	movb	%al, (%edx)
	addl	$1, -24(%ebp)
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 4(%esp)
	movl	$42, (%esp)
	call	_fputc
L103:
	call	_getch
	movb	%al, -41(%ebp)
	cmpb	$32, -41(%ebp)
	jne	L104
	movl	$10, (%esp)
	call	_putchar
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$_ACC+44, (%esp)
	call	_strcmp
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_LoadingPage
	cmpl	$0, -12(%ebp)
	je	L105
	cmpl	$2, -20(%ebp)
	jg	L105
	jmp	L102
L105:
	movl	-28(%ebp), %eax
	movl	%eax, -48(%ebp)
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	___mingw_free
	nop
	cmpl	$3, -20(%ebp)
	jne	L106
	call	_clearscr
	movl	$LC77, (%esp)
	call	_printf
	movl	$LC78, (%esp)
	call	_printf
	call	_getch
	jmp	L101
L106:
	call	_clearscr
	movl	$_ACC, 4(%esp)
	movl	$LC79, (%esp)
	call	_printf
	movl	$LC80, (%esp)
	call	_printf
	movl	$LC81, (%esp)
	call	_puts
	movl	$LC82, (%esp)
	call	_printf
L111:
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	call	_getchar
	movb	%al, -42(%ebp)
	movsbl	-42(%ebp), %eax
	cmpl	$121, %eax
	je	L107
	cmpl	$121, %eax
	jg	L108
	cmpl	$110, %eax
	je	L109
	cmpl	$110, %eax
	jg	L108
	cmpl	$78, %eax
	je	L109
	cmpl	$89, %eax
	jne	L108
L107:
	movl	$0, -16(%ebp)
	jmp	L110
L109:
	movl	$1, -16(%ebp)
L108:
	movl	$-1, -16(%ebp)
	movl	$LC83, (%esp)
	call	_printf
	nop
L110:
	cmpl	$-1, -16(%ebp)
	je	L111
	movl	$1, -12(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L101
	movl	_ACC+20, %eax
	movl	%eax, _CD
	movl	-40(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$4, 4(%esp)
	movl	$_CD, (%esp)
	call	_fwrite
	movl	$LC84, (%esp)
	call	_printf
	movl	$LC85, (%esp)
	call	_printf
	movl	$LC86, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	movl	$LC15, (%esp)
	call	_printf
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	call	_getch
	jmp	L97
L101:
	movl	-32(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L112
	cmpl	$0, -12(%ebp)
	jne	L113
	movl	$LC87, (%esp)
	call	_printf
L113:
	cmpl	$0, -16(%ebp)
	je	L114
	call	_clearscr
	movl	$LC88, (%esp)
	call	_printf
L114:
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC89, (%esp)
	call	_printf
	call	_getch
	nop
L97:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE43:
	.globl	_fixedDepositInterest
	.def	_fixedDepositInterest;	.scl	2;	.type	32;	.endef
_fixedDepositInterest:
LFB44:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	flds	8(%ebp)
	fstpl	-16(%ebp)
	fildl	16(%ebp)
	flds	12(%ebp)
	flds	LC90
	fdivrp	%st, %st(1)
	fld1
	faddp	%st, %st(1)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	fmull	-16(%ebp)
	fstps	-16(%ebp)
	flds	-16(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE44:
	.section .rdata,"dr"
	.align 4
LC92:
	.ascii "Thank you for choosing to grow money with us by investing in 'Fixed Deposit'.\0"
	.align 4
LC93:
	.ascii "It is our pleasure to give you the best interest rate in the country.\0"
LC94:
	.ascii "Types of F.D.s we offer:\0"
LC95:
	.ascii "1. 2.5%% p.a. for 6 months\12\0"
LC96:
	.ascii "2. 4.5%% p.a. for 1 year\12\0"
LC97:
	.ascii "3. 5.2%% p.a. for 2 years\12\0"
LC98:
	.ascii "4. 5.5%% p.a. for 3 years\12\0"
	.align 4
LC99:
	.ascii "\12N.B.: As per Govt. rules, senior citizens will recieve a 0.5%% extra interest (over and above the standard rate).\0"
LC100:
	.ascii "\12\12Please enter a choice: \0"
	.text
	.globl	_fixedDepositMenu
	.def	_fixedDepositMenu;	.scl	2;	.type	32;	.endef
_fixedDepositMenu:
LFB45:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC92, (%esp)
	call	_printf
	movl	$LC35, (%esp)
	call	_puts
	movl	$LC93, (%esp)
	call	_printf
	movl	$LC35, (%esp)
	call	_puts
	movl	$LC94, (%esp)
	call	_puts
	movl	$LC95, (%esp)
	call	_printf
	movl	$LC96, (%esp)
	call	_printf
	movl	$LC97, (%esp)
	call	_printf
	movl	$LC98, (%esp)
	call	_printf
	movl	$LC99, (%esp)
	call	_printf
	movl	$LC100, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE45:
	.section .rdata,"dr"
	.align 4
LC101:
	.ascii "Thank you for choosing to grow money with us by investing in 'Recurring Deposit'.\0"
LC102:
	.ascii "Types of R.D.s we offer:\0"
LC103:
	.ascii "\12Please enter a choice: \0"
	.text
	.globl	_recurringDepositMenu
	.def	_recurringDepositMenu;	.scl	2;	.type	32;	.endef
_recurringDepositMenu:
LFB46:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC101, (%esp)
	call	_printf
	movl	$LC35, (%esp)
	call	_puts
	movl	$LC93, (%esp)
	call	_printf
	movl	$LC35, (%esp)
	call	_puts
	movl	$LC102, (%esp)
	call	_puts
	movl	$LC95, (%esp)
	call	_printf
	movl	$LC96, (%esp)
	call	_printf
	movl	$LC97, (%esp)
	call	_printf
	movl	$LC98, (%esp)
	call	_printf
	movl	$LC103, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE46:
	.globl	_recurringDepositInterest
	.def	_recurringDepositInterest;	.scl	2;	.type	32;	.endef
_recurringDepositInterest:
LFB47:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$1, -16(%ebp)
	jmp	L121
L122:
	flds	8(%ebp)
	fstpl	-32(%ebp)
	flds	12(%ebp)
	flds	LC104
	fmulp	%st, %st(1)
	flds	LC105
	fdivrp	%st, %st(1)
	flds	12(%ebp)
	flds	LC104
	fdivrp	%st, %st(1)
	fld1
	faddp	%st, %st(1)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	fldl	-32(%ebp)
	fmulp	%st, %st(1)
	flds	-12(%ebp)
	faddp	%st, %st(1)
	fstps	-12(%ebp)
	addl	$1, -16(%ebp)
L121:
	movl	-16(%ebp), %eax
	cmpl	16(%ebp), %eax
	jle	L122
	flds	-12(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE47:
	.section .rdata,"dr"
	.align 4
LC106:
	.ascii "Sorry! Your account is blocked due to some forseen event. Contact the bank employee. Toll Number: 1800 000 1234\0"
	.text
	.globl	_accountIsBlocked
	.def	_accountIsBlocked;	.scl	2;	.type	32;	.endef
_accountIsBlocked:
LFB48:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	cmpb	$0, -12(%ebp)
	je	L125
	movl	$0, %eax
	jmp	L126
L125:
	call	_clearscr
	movl	$LC106, (%esp)
	call	_printf
	call	_getch
	movl	$1, %eax
L126:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE48:
	.section .rdata,"dr"
	.align 4
LC107:
	.ascii "\15Details Verified Successfully!\0"
	.align 4
LC108:
	.ascii "\15Details cannot be verified. Please try again.\0"
	.text
	.globl	_LoadingPage
	.def	_LoadingPage;	.scl	2;	.type	32;	.endef
_LoadingPage:
LFB49:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$1684107084, -24(%ebp)
	movl	$6778473, -20(%ebp)
	movl	$LC35, (%esp)
	call	_puts
	movl	$0, -12(%ebp)
	jmp	L128
L133:
	movl	$0, -16(%ebp)
	jmp	L129
L130:
	addl	$1, -16(%ebp)
L129:
	cmpl	$214748363, -16(%ebp)
	jle	L130
	cmpl	$6, -12(%ebp)
	jg	L131
	leal	-24(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_putchar
	jmp	L132
L131:
	movl	$46, (%esp)
	call	_putchar
L132:
	addl	$1, -12(%ebp)
L128:
	cmpl	$10, -12(%ebp)
	jle	L133
	cmpl	$0, 8(%ebp)
	jne	L134
	movl	$LC107, (%esp)
	call	_printf
	jmp	L135
L134:
	movl	$LC108, (%esp)
	call	_printf
L135:
	movl	$0, -16(%ebp)
	jmp	L136
L137:
	addl	$1, -16(%ebp)
L136:
	cmpl	$2147483647, -16(%ebp)
	jne	L137
	call	_clearscr
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE49:
	.section .rdata,"dr"
	.align 4
LC109:
	.ascii "\12The database cannot be found.\0"
	.align 4
LC110:
	.ascii "Printing the customers who have taken loan from us:\0"
LC111:
	.ascii "\12%d\11%s\11%f\11%d year(s)\0"
	.align 4
LC112:
	.ascii "\12There are %d peoples who have taken loan\0"
	.text
	.globl	_checkLoansTaken
	.def	_checkLoansTaken;	.scl	2;	.type	32;	.endef
_checkLoansTaken:
LFB50:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	$1, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L139
	movl	$LC109, (%esp)
	call	_printf
	call	_getch
	movl	$1, (%esp)
	call	_exit
L139:
	call	_clearscr
	movl	$LC110, (%esp)
	call	_puts
	jmp	L140
L141:
	movzbl	_ACC+85, %eax
	testb	%al, %al
	je	L140
	movl	_ACC+80, %ecx
	flds	_ACC+92
	movl	_ACC+20, %edx
	movl	-12(%ebp), %eax
	leal	1(%eax), %ebx
	movl	%ebx, -12(%ebp)
	movl	%ecx, 28(%esp)
	fstpl	20(%esp)
	movl	$_ACC, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$LC111, 4(%esp)
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, (%esp)
	call	_fprintf
L140:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L141
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC112, (%esp)
	call	_printf
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
	nop
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE50:
	.globl	_loanApproval
	.def	_loanApproval;	.scl	2;	.type	32;	.endef
_loanApproval:
LFB51:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	cmpb	$0, -4(%ebp)
	je	L143
	movl	$0, %eax
	jmp	L144
L143:
	movl	$1, %eax
L144:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE51:
	.globl	_isCibilValid
	.def	_isCibilValid;	.scl	2;	.type	32;	.endef
_isCibilValid:
LFB52:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$0, 8(%ebp)
	jle	L146
	cmpl	$900, 8(%ebp)
	jg	L146
	movl	$1, %eax
	jmp	L147
L146:
	movl	$0, %eax
L147:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE52:
	.section .rdata,"dr"
	.align 4
LC113:
	.ascii "\12We are extremely sorry! We could not approve the loan amount\0"
	.align 4
LC114:
	.ascii "\12Dear applicant,\12We are happy to serve you. But your cibil score hints of taking loan at highest rate\0"
	.align 4
LC115:
	.ascii "\12\12Do you wish to take the loan at 18 %% interest rate \0"
LC116:
	.ascii "'Y' or 'N' ? \0"
	.align 4
LC117:
	.ascii "\12Dear applicant,\12We are happy to serve you. But your cibil score hints of taking loan at a higher rate\0"
	.align 4
LC118:
	.ascii "\12\12Do you wish to take the loan at 15 %% interest rate \0"
	.align 4
LC119:
	.ascii "\12Dear applicant,\12We are happy to serve you. Congratulations on maintaing a great CIBIL Score\0"
	.align 4
LC120:
	.ascii "\12\12Do you wish to take the loan at 12 %% interest rate \0"
	.text
	.globl	_getCreditLimitagainstCibil
	.def	_getCreditLimitagainstCibil;	.scl	2;	.type	32;	.endef
_getCreditLimitagainstCibil:
LFB53:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$550, 8(%ebp)
	jg	L149
	movl	$LC113, (%esp)
	call	_printf
	movl	$1, %eax
	jmp	L150
L149:
	cmpl	$650, 8(%ebp)
	jg	L151
	movl	$LC114, (%esp)
	call	_printf
	movl	$LC115, (%esp)
	call	_printf
	movl	$LC116, (%esp)
	call	_printf
	movl	$2, %eax
	jmp	L150
L151:
	cmpl	$750, 8(%ebp)
	jg	L152
	movl	$LC117, (%esp)
	call	_printf
	movl	$LC118, (%esp)
	call	_printf
	movl	$LC116, (%esp)
	call	_printf
	movl	$3, %eax
	jmp	L150
L152:
	movl	$LC119, (%esp)
	call	_printf
	movl	$LC120, (%esp)
	call	_printf
	movl	$LC116, (%esp)
	call	_printf
	movl	$4, %eax
L150:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE53:
	.globl	_calculatemonthlyLoan
	.def	_calculatemonthlyLoan;	.scl	2;	.type	32;	.endef
_calculatemonthlyLoan:
LFB54:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	flds	12(%ebp)
	flds	LC121
	fdivrp	%st, %st(1)
	fstps	12(%ebp)
	movl	16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, 16(%ebp)
	flds	8(%ebp)
	fmuls	12(%ebp)
	fstpl	-32(%ebp)
	fildl	16(%ebp)
	flds	12(%ebp)
	fld1
	faddp	%st, %st(1)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	fmull	-32(%ebp)
	fstpl	-32(%ebp)
	fildl	16(%ebp)
	flds	12(%ebp)
	fld1
	faddp	%st, %st(1)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	fld1
	fsubrp	%st, %st(1)
	fdivrl	-32(%ebp)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE54:
	.section .rdata,"dr"
	.align 4
LC123:
	.ascii "\12Enter the amount you require: \0"
LC125:
	.ascii "\12Please enter a valid amount\0"
	.text
	.globl	_getLoanAmount
	.def	_getLoanAmount;	.scl	2;	.type	32;	.endef
_getLoanAmount:
LFB55:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
L156:
	movl	$LC123, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC60, (%esp)
	call	_scanf
	flds	-12(%ebp)
	fld1
	fcompp
	fnstsw	%ax
	sahf
	ja	L157
	flds	-12(%ebp)
	fcomps	LC124
	fnstsw	%ax
	sahf
	jbe	L161
L157:
	movl	$LC125, (%esp)
	call	_puts
	jmp	L156
L161:
	flds	-12(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE55:
	.section .rdata,"dr"
	.align 4
LC126:
	.ascii "\12Enter the time for the repayment in years. Minimum is 1 year: \0"
	.text
	.globl	_getTime
	.def	_getTime;	.scl	2;	.type	32;	.endef
_getTime:
LFB56:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
L163:
	movl	$LC126, (%esp)
	call	_printf
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	testl	%eax, %eax
	jle	L163
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE56:
	.section .rdata,"dr"
LC127:
	.ascii "Loan\0"
	.text
	.globl	_updateLoanDetails
	.def	_updateLoanDetails;	.scl	2;	.type	32;	.endef
_updateLoanDetails:
LFB57:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC127, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	jmp	L166
L168:
	movl	_ACC+20, %edx
	movl	_LD, %eax
	cmpl	%eax, %edx
	jne	L167
	movb	$1, _ACC+85
	flds	_LD+4
	fstps	_ACC+88
	flds	_LD+8
	fstps	_ACC+92
L167:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
L166:
	movl	-12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L168
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC2, (%esp)
	call	_remove
	movl	$LC2, 4(%esp)
	movl	$LC18, (%esp)
	call	_rename
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE57:
	.section .rdata,"dr"
	.align 4
LC128:
	.ascii "\12==================================================================================================================================\0"
	.align 4
LC129:
	.ascii "\12\11Welcome to DIGITAL BANK Pvt. Ltd.\11\0"
	.align 4
LC130:
	.ascii "| A unit of DIGITAL World Holdings Pvt. Ltd.     | Building nation since 1980\0"
	.align 4
LC131:
	.ascii "\12==================================================================================================================================\12\0"
	.text
	.globl	_MainHeader
	.def	_MainHeader;	.scl	2;	.type	32;	.endef
_MainHeader:
LFB58:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC128, (%esp)
	call	_printf
	movl	$14, (%esp)
	call	_SetColor
	movl	$LC129, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_SetColor
	movl	$LC130, (%esp)
	call	_printf
	movl	$15, (%esp)
	call	_SetColor
	movl	$LC131, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE58:
	.section .rdata,"dr"
LC132:
	.ascii "1. Employee Login\0"
LC133:
	.ascii "2. Bank Customer Login\0"
LC134:
	.ascii "3. Exit the process\0"
LC135:
	.ascii "\12Enter your choice: \0"
	.text
	.globl	_LoginMenu
	.def	_LoginMenu;	.scl	2;	.type	32;	.endef
_LoginMenu:
LFB59:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_MainHeader
	movl	$LC132, (%esp)
	call	_puts
	movl	$LC133, (%esp)
	call	_puts
	movl	$LC134, (%esp)
	call	_puts
	movl	$LC135, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE59:
	.section .rdata,"dr"
LC136:
	.ascii "1. View Customer's List\0"
LC137:
	.ascii "2. View Transactions\0"
LC138:
	.ascii "3. View accounts blocked\0"
LC139:
	.ascii "4. Account closure request\0"
LC140:
	.ascii "5. Unblock Accounts\0"
LC141:
	.ascii "6. Views Loans Taken\0"
LC142:
	.ascii "7. Exit\0"
	.text
	.globl	_PrintMenuEmployee
	.def	_PrintMenuEmployee;	.scl	2;	.type	32;	.endef
_PrintMenuEmployee:
LFB60:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_MainHeader
	movl	$LC136, (%esp)
	call	_puts
	movl	$LC137, (%esp)
	call	_puts
	movl	$LC138, (%esp)
	call	_puts
	movl	$LC139, (%esp)
	call	_puts
	movl	$LC140, (%esp)
	call	_puts
	movl	$LC141, (%esp)
	call	_puts
	movl	$LC142, (%esp)
	call	_puts
	movl	$LC135, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE60:
	.section .rdata,"dr"
LC143:
	.ascii "1. Open an account with us\0"
	.align 4
LC144:
	.ascii "2. Update the details of an account\0"
LC145:
	.ascii "3. Transfer Money\0"
LC146:
	.ascii "4. Check account details\0"
LC147:
	.ascii "5. Get a persoanl loan\0"
LC148:
	.ascii "6. Close your account\0"
	.text
	.globl	_PrintMenuCustomer
	.def	_PrintMenuCustomer;	.scl	2;	.type	32;	.endef
_PrintMenuCustomer:
LFB61:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	_MainHeader
	movl	$LC143, (%esp)
	call	_puts
	movl	$LC144, (%esp)
	call	_puts
	movl	$LC145, (%esp)
	call	_puts
	movl	$LC146, (%esp)
	call	_puts
	movl	$LC147, (%esp)
	call	_puts
	movl	$LC148, (%esp)
	call	_puts
	movl	$LC142, (%esp)
	call	_puts
	movl	$LC135, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE61:
	.section .rdata,"dr"
LC149:
	.ascii "PendingTransactions\0"
LC150:
	.ascii "Database cannot be found.\0"
	.text
	.globl	_performPendingTransaction
	.def	_performPendingTransaction;	.scl	2;	.type	32;	.endef
_performPendingTransaction:
LFB62:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_time
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_localtime
	movl	%eax, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC149, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -24(%ebp)
	movl	$LC34, 4(%esp)
	movl	$LC24, (%esp)
	call	_fopen
	movl	%eax, -28(%ebp)
	cmpl	$0, -16(%ebp)
	je	L174
	cmpl	$0, -20(%ebp)
	je	L174
	cmpl	$0, -24(%ebp)
	je	L174
	cmpl	$0, -28(%ebp)
	jne	L175
L174:
	movl	$LC150, (%esp)
	call	_printf
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
	movl	$1, (%esp)
	call	_exit
L175:
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$8, 4(%esp)
	movl	$_PT, (%esp)
	call	_fread
	jmp	L176
L178:
	movl	_ACC+20, %edx
	movl	_PT, %eax
	cmpl	%eax, %edx
	jne	L177
	movl	8(%ebp), %eax
	movl	%eax, _LL+24
	movl	_ACC+20, %eax
	movl	%eax, _LL+28
	flds	_ACC+72
	fstps	_LL+36
	flds	_ACC+72
	flds	_PT+4
	faddp	%st, %st(1)
	fstps	_ACC+72
	flds	_ACC+72
	fstps	_LL+40
	movb	$84, _LL+32
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, _LL+20
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, _LL
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, _LL+16
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, _LL+12
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	addl	$1, %eax
	movl	%eax, _LL+4
	movl	-12(%ebp), %eax
	movl	20(%eax), %eax
	addl	$1900, %eax
	movl	%eax, _LL+8
	movl	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$44, 4(%esp)
	movl	$_LL, (%esp)
	call	_fwrite
L177:
	movl	-24(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
L176:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L178
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC2, (%esp)
	call	_remove
	movl	$LC149, (%esp)
	call	_remove
	movl	$LC2, 4(%esp)
	movl	$LC18, (%esp)
	call	_rename
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE62:
	.section .rdata,"dr"
LC151:
	.ascii "setterm -bold on\0"
LC152:
	.ascii "\12Enter your account number :\0"
	.align 4
LC153:
	.ascii "Sorry your account is blocked due to suspecious activity. You are not allowed to withdraw or transfer money. You can only deposit money into your account. We will notify you once your account is unblocked.\0"
	.align 4
LC154:
	.ascii "\12Do you want to deposit money? (Y/N) \0"
LC155:
	.ascii "\12Please enter a valid choice.\0"
	.align 4
LC156:
	.ascii "\12You have reached the limit of entering the password. If you forget, you can change your password.\0"
	.align 4
LC157:
	.ascii "\12\12Do you wih to change your password (Y or N): \0"
	.align 4
LC158:
	.ascii "\12Enter the 6-digit OTP received in your mobile number: \0"
LC159:
	.ascii "%6s\0"
LC160:
	.ascii "000000\0"
LC161:
	.ascii "Yeppie. Matched\0"
LC162:
	.ascii "\12\12Please re-enter password: \0"
LC163:
	.ascii "%[A-Z,a-z,0-9]s\0"
	.align 4
LC164:
	.ascii "\12Great! Your details have been updated!\0"
	.align 4
LC165:
	.ascii "\12Please enter the correct otp: \0"
	.align 4
LC166:
	.ascii "\12It seeems like you have utilised all the attempts. Account blocked. Please contact bank employee to unblock your account\0"
	.align 4
LC167:
	.ascii "\12Account blocked for entering wrong password. Please contact bank employee to unblock your account\0"
LC168:
	.ascii "Press any key to continue...\0"
LC169:
	.ascii "Please enter a valid chocie.\0"
LC170:
	.ascii "\12Press 1. to \0"
LC171:
	.ascii "deposit\0"
LC172:
	.ascii " money into your account\0"
LC173:
	.ascii "\12Press 2. to \0"
LC174:
	.ascii "withdraw\0"
LC175:
	.ascii " money from your account\0"
LC176:
	.ascii "\12Press 3. to \0"
LC177:
	.ascii "send\0"
LC178:
	.ascii " money to a beneficiary\0"
	.align 4
LC179:
	.ascii "\12Currently the process of sending and receiving money, in Abroad, is under process. We will notify you once it is functional\0"
LC180:
	.ascii "\12\12Enter choice: \0"
	.align 4
LC181:
	.ascii "Enter the account number of the beneficiay: \0"
	.align 4
LC182:
	.ascii "\12Please enter a valid account number\0"
	.align 4
LC183:
	.ascii "\12Your current balance is Rs. %.2f\0"
LC184:
	.ascii "withdrawn\0"
LC185:
	.ascii "deposited\0"
LC186:
	.ascii "\12\12Enter the amount to be %s: \0"
	.align 4
LC187:
	.ascii "\12Sorry! Your insufficient balance. Process failed.\0"
	.align 4
LC188:
	.ascii "\12Sorry! Transcation failed. The account of the beneficiary is blocked.\0"
	.align 4
LC189:
	.ascii "\12Sorry! No accounts found. Would you like to go back (Y or N)? \0"
	.align 4
LC190:
	.ascii "\12Account Overdrawn! Balance is negative. Please pay the amount soon to avoid penalty\0"
	.text
	.globl	_sendOrReceiveMoney
	.def	_sendOrReceiveMoney;	.scl	2;	.type	32;	.endef
_sendOrReceiveMoney:
LFB63:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$200, %esp
	movl	$0, -24(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_time
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_localtime
	movl	%eax, -28(%ebp)
	movl	$LC151, (%esp)
	call	_system
	movl	$1, 4(%esp)
	movl	$21, (%esp)
	call	_calloc
	movl	%eax, -32(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -36(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC149, (%esp)
	call	_fopen
	movl	%eax, -40(%ebp)
	movl	$LC34, 4(%esp)
	movl	$LC24, (%esp)
	call	_fopen
	movl	%eax, -44(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -48(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -52(%ebp)
	cmpl	$0, -36(%ebp)
	je	L180
	cmpl	$0, -44(%ebp)
	je	L180
	cmpl	$0, -40(%ebp)
	je	L180
	cmpl	$0, -48(%ebp)
	je	L180
	cmpl	$0, -52(%ebp)
	jne	L181
L180:
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L181:
	movl	$LC152, (%esp)
	call	_printf
	leal	-72(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	jmp	L182
L227:
	movl	_ACC+20, %edx
	movl	-72(%ebp), %eax
	cmpl	%eax, %edx
	jne	L183
	movzbl	_ACC+84, %eax
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	_accountIsBlocked
	cmpl	$1, %eax
	jne	L232
	call	_clearscr
	movl	$LC153, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
L190:
	movl	$LC154, (%esp)
	call	_printf
	call	_getchar
	movb	%al, -53(%ebp)
	movsbl	-53(%ebp), %eax
	cmpl	$121, %eax
	je	L233
	cmpl	$121, %eax
	jg	L186
	cmpl	$110, %eax
	je	L187
	cmpl	$110, %eax
	jg	L186
	cmpl	$78, %eax
	je	L187
	cmpl	$89, %eax
	jne	L186
	jmp	L233
L187:
	movl	$0, -24(%ebp)
	jmp	L189
L186:
	movl	$LC155, (%esp)
	call	_puts
	movl	$-1, -24(%ebp)
	nop
L189:
	movl	$-1, -24(%ebp)
	jmp	L190
L232:
	nop
L184:
	call	_clearscr
	movl	$LC31, (%esp)
	call	_printf
	addl	$1, -16(%ebp)
	jmp	L191
L192:
	movl	-12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%eax, %edx
	movzbl	-53(%ebp), %eax
	movb	%al, (%edx)
	addl	$1, -12(%ebp)
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 4(%esp)
	movl	$42, (%esp)
	call	_fputc
L191:
	call	_getch
	movb	%al, -53(%ebp)
	cmpb	$32, -53(%ebp)
	jne	L192
	movl	$10, (%esp)
	call	_putchar
	movl	-12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$_ACC+44, (%esp)
	call	_strcmp
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	je	L193
	cmpl	$2, -16(%ebp)
	jg	L193
	jmp	L184
L193:
	movl	-32(%ebp), %eax
	movl	%eax, -60(%ebp)
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	___mingw_free
	nop
	cmpl	$3, -16(%ebp)
	jne	L194
	call	_clearscr
	movl	$LC156, (%esp)
	call	_printf
	movl	$LC157, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	call	_getchar
	movb	%al, -53(%ebp)
	movl	$0, -16(%ebp)
	movsbl	-53(%ebp), %eax
	cmpl	$78, %eax
	je	L195
	cmpl	$89, %eax
	jne	L196
	call	_clearscr
L197:
	addl	$1, -16(%ebp)
	movl	$LC158, (%esp)
	call	_printf
	leal	-183(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC159, (%esp)
	call	_scanf
	movl	$LC160, 4(%esp)
	leal	-183(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jne	L198
	cmpl	$2, -16(%ebp)
	jg	L198
	movl	$LC161, (%esp)
	call	_puts
	movl	$LC53, (%esp)
	call	_puts
	movl	$LC54, (%esp)
	call	_puts
	movl	$LC55, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$_ACC+44, 4(%esp)
	movl	$LC56, (%esp)
	call	_scanf
	jmp	L199
L200:
	movl	$LC162, (%esp)
	call	_printf
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$_ACC+44, 4(%esp)
	movl	$LC163, (%esp)
	call	_scanf
L199:
	movl	$_ACC+44, (%esp)
	call	_strlen
	cmpl	$20, %eax
	ja	L200
	call	_clearscr
	movl	$LC164, (%esp)
	call	_printf
	jmp	L183
L198:
	cmpl	$2, -16(%ebp)
	jg	L202
	call	_clearscr
	movl	$LC165, (%esp)
	call	_printf
	jmp	L197
L202:
	call	_clearscr
	movl	$LC166, (%esp)
	call	_printf
	movb	$0, _ACC+84
	jmp	L183
L195:
	call	_clearscr
	movl	$LC167, (%esp)
	call	_printf
	movb	$0, _ACC+84
	movl	$LC35, (%esp)
	call	_puts
	movl	$LC168, (%esp)
	call	_printf
	call	_getch
L196:
	movl	$LC169, (%esp)
	call	_printf
	jmp	L183
L194:
	call	_clearscr
	movl	$LC170, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_SetColor
	movl	$LC171, (%esp)
	call	_printf
	movl	$15, (%esp)
	call	_SetColor
	movl	$LC172, (%esp)
	call	_printf
	movl	$LC173, (%esp)
	call	_printf
	movl	$12, (%esp)
	call	_SetColor
	movl	$LC174, (%esp)
	call	_printf
	movl	$15, (%esp)
	call	_SetColor
	movl	$LC175, (%esp)
	call	_printf
	movl	$LC176, (%esp)
	call	_printf
	movl	$14, (%esp)
	call	_SetColor
	movl	$LC177, (%esp)
	call	_printf
	movl	$15, (%esp)
	call	_SetColor
	movl	$LC178, (%esp)
	call	_printf
	movl	$LC179, (%esp)
	call	_printf
L210:
	movl	$LC180, (%esp)
	call	_printf
	leal	-64(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	-64(%ebp), %eax
	cmpl	$2, %eax
	jg	L204
	testl	%eax, %eax
	jg	L205
	jmp	L206
L204:
	cmpl	$3, %eax
	je	L207
	jmp	L206
L205:
	movl	-72(%ebp), %eax
	movl	%eax, -76(%ebp)
	jmp	L208
L207:
	call	_clearscr
	movl	$LC181, (%esp)
	call	_printf
	leal	-76(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	jmp	L208
L206:
	movl	$LC182, (%esp)
	call	_printf
L208:
	movl	-64(%ebp), %eax
	testl	%eax, %eax
	js	L209
	movl	-64(%ebp), %eax
	cmpl	$3, %eax
	jg	L210
L209:
	flds	_ACC+72
	fstpl	4(%esp)
	movl	$LC183, (%esp)
	call	_printf
	movl	-64(%ebp), %eax
	cmpl	$1, %eax
	je	L211
	movl	-64(%ebp), %eax
	cmpl	$2, %eax
	jne	L212
	movl	$LC184, %eax
	jmp	L214
L212:
	movl	$LC177, %eax
	jmp	L214
L211:
	movl	$LC185, %eax
L214:
	movl	%eax, 4(%esp)
	movl	$LC186, (%esp)
	call	_printf
	leal	-80(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC60, (%esp)
	call	_scanf
	movl	-64(%ebp), %eax
	cmpl	$2, %eax
	jne	L215
	flds	_ACC+72
	flds	-80(%ebp)
	fcompp
	fnstsw	%ax
	sahf
	jbe	L216
	movzbl	_ACC+76, %eax
	cmpb	$83, %al
	jne	L216
	movl	$LC187, (%esp)
	call	_puts
	jmp	L219
L216:
	flds	_ACC+72
	flds	-80(%ebp)
	fsubrp	%st, %st(1)
	fstps	_ACC+72
	movl	_ACC+20, %eax
	movl	%eax, _LL+24
	flds	_ACC+72
	fstps	_LL+40
	movl	-76(%ebp), %eax
	movl	%eax, _LL+28
	flds	_ACC+72
	flds	-80(%ebp)
	faddp	%st, %st(1)
	fstps	_LL+36
	movb	$87, _LL+32
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, _LL+20
	movl	-28(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, _LL
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, _LL+16
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, _LL+12
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	addl	$1, %eax
	movl	%eax, _LL+4
	movl	-28(%ebp), %eax
	movl	20(%eax), %eax
	addl	$1900, %eax
	movl	%eax, _LL+8
	movl	-44(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$44, 4(%esp)
	movl	$_LL, (%esp)
	call	_fwrite
	jmp	L219
L215:
	movl	-64(%ebp), %eax
	cmpl	$1, %eax
	jne	L234
	jmp	L188
L233:
	nop
L188:
	flds	_ACC+72
	flds	-80(%ebp)
	faddp	%st, %st(1)
	fstps	_ACC+72
	movl	_ACC+20, %eax
	movl	%eax, _LL+24
	flds	_ACC+72
	fstps	_LL+40
	movl	-76(%ebp), %eax
	movl	%eax, _LL+28
	flds	_ACC+72
	flds	-80(%ebp)
	fsubrp	%st, %st(1)
	fstps	_LL+36
	movb	$68, _LL+32
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, _LL+20
	movl	-28(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, _LL
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, _LL+16
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, _LL+12
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	addl	$1, %eax
	movl	%eax, _LL+4
	movl	-28(%ebp), %eax
	movl	20(%eax), %eax
	addl	$1900, %eax
	movl	%eax, _LL+8
	movl	-44(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$44, 4(%esp)
	movl	$_LL, (%esp)
	call	_fwrite
	jmp	L219
L234:
	nop
L220:
	movl	$0, -20(%ebp)
	jmp	L221
L224:
	movl	-156(%ebp), %edx
	movl	-76(%ebp), %eax
	cmpl	%eax, %edx
	jne	L221
	movzbl	-92(%ebp), %eax
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	_accountIsBlocked
	cmpl	$1, %eax
	jne	L222
	call	_clearscr
	movl	$LC188, (%esp)
	call	_printf
	movl	$-1, -20(%ebp)
	jmp	L223
L222:
	movl	$1, -20(%ebp)
	flds	_ACC+72
	flds	-80(%ebp)
	fsubrp	%st, %st(1)
	fstps	_ACC+72
	movl	_ACC+20, %eax
	movl	%eax, _LL+24
	flds	_ACC+72
	fstps	_LL+40
	movl	-76(%ebp), %eax
	movl	%eax, _LL+28
	flds	_ACC+72
	flds	-80(%ebp)
	faddp	%st, %st(1)
	fstps	_LL+36
	movb	$84, _LL+32
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, _LL+20
	movl	-28(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, _LL
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, _LL+16
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, _LL+12
	movl	-28(%ebp), %eax
	movl	16(%eax), %eax
	addl	$1, %eax
	movl	%eax, _LL+4
	movl	-28(%ebp), %eax
	movl	20(%eax), %eax
	addl	$1900, %eax
	movl	%eax, _LL+8
	movl	-44(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$44, 4(%esp)
	movl	$_LL, (%esp)
	call	_fwrite
	flds	-80(%ebp)
	fstps	_PT+4
	movl	-156(%ebp), %eax
	movl	%eax, _PT
	movl	-40(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$8, 4(%esp)
	movl	$_PT, (%esp)
	call	_fwrite
L221:
	movl	-48(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	leal	-176(%ebp), %eax
	movl	%eax, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L224
L223:
	cmpl	$0, -20(%ebp)
	jne	L219
	call	_clearscr
	movl	$LC189, (%esp)
	call	_printf
	call	_getch
	movb	%al, -53(%ebp)
	cmpb	$89, -53(%ebp)
	je	L225
	cmpb	$121, -53(%ebp)
	jne	L219
L225:
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	_rewind
	jmp	L220
L219:
	flds	_ACC+72
	fstpl	4(%esp)
	movl	$LC183, (%esp)
	call	_printf
	movzbl	_ACC+76, %eax
	cmpb	$67, %al
	jne	L183
	flds	_ACC+72
	fldz
	fcompp
	fnstsw	%ax
	sahf
	jbe	L183
	movl	$LC190, (%esp)
	call	_printf
L183:
	movl	-52(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
L182:
	movl	-36(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L227
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-52(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC2, (%esp)
	call	_remove
	movl	$LC2, 4(%esp)
	movl	$LC18, (%esp)
	call	_rename
	movl	-64(%ebp), %eax
	cmpl	$3, %eax
	jne	L228
	movl	-76(%ebp), %eax
	movl	%eax, (%esp)
	call	_performPendingTransaction
	jmp	L229
L228:
	movl	$LC149, (%esp)
	call	_remove
L229:
	movl	$LC35, (%esp)
	call	_puts
	movl	$LC168, (%esp)
	call	_printf
	call	_getch
	movb	%al, -53(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE63:
	.section .rdata,"dr"
	.align 4
LC191:
	.ascii "\12The database is either deleted or cannot be found.\12\12Please contact the bank technical support. Toll Number: 1800 000 1234\0"
	.align 4
LC192:
	.ascii "\12Enter the account number to be unblocked: \0"
	.align 4
LC193:
	.ascii "\12Sorry. No account exists with the given account number. Please enter a valid account number next time.\0"
	.align 4
LC194:
	.ascii "\12The account holder having account number %ld is unblocked. Communication of the same has been sent to the customer.\0"
	.text
	.globl	_unblockAccount
	.def	_unblockAccount;	.scl	2;	.type	32;	.endef
_unblockAccount:
LFB64:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	cmpl	$0, -16(%ebp)
	je	L236
	cmpl	$0, -20(%ebp)
	jne	L237
L236:
	movl	$LC191, (%esp)
	call	_puts
	jmp	L235
L237:
	movl	$LC192, (%esp)
	call	_printf
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	jmp	L239
L241:
	movl	_ACC+20, %edx
	movl	-24(%ebp), %eax
	cmpl	%eax, %edx
	jne	L240
	movzbl	_ACC+84, %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L240
	addl	$1, -12(%ebp)
	movb	$1, _ACC+84
L240:
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
L239:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L241
	cmpl	$0, -12(%ebp)
	jne	L242
	movl	$LC193, (%esp)
	call	_printf
	jmp	L243
L242:
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC194, (%esp)
	call	_printf
L243:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC2, (%esp)
	call	_remove
	movl	$LC2, 4(%esp)
	movl	$LC18, (%esp)
	call	_rename
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
L235:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE64:
	.section .rdata,"dr"
	.align 4
LC195:
	.ascii "\12Please select one of the following:\0"
LC196:
	.ascii "\12"
	.ascii "1. Update your name\0"
LC197:
	.ascii "\12"
	.ascii "2. Update mobile number\0"
LC198:
	.ascii "\12"
	.ascii "3. Update your ID number\0"
LC199:
	.ascii "\12"
	.ascii "4. Update your age\0"
LC200:
	.ascii "\12"
	.ascii "5. Change your account type\0"
LC201:
	.ascii "\12\12Enter your choice: \0"
	.align 4
LC202:
	.ascii "\12Please enter your correct name: \0"
LC203:
	.ascii "\12Your name is updated.\0"
	.align 4
LC204:
	.ascii "\12Please enter your new mobile number: \0"
	.align 4
LC205:
	.ascii "\12Your new mobile number has been saved.\0"
	.align 4
LC206:
	.ascii "\12Please enter your ID number: \0"
	.align 4
LC207:
	.ascii "\12Details for your ID number has been updated.\0"
	.align 4
LC208:
	.ascii "\12Please enter your correct age: \0"
	.align 4
LC209:
	.ascii "\12Your age is successfully stored.\0"
	.align 4
LC210:
	.ascii "\12Account type has been changed.\0"
	.align 4
LC211:
	.ascii "\12Invalid choice. Please do enter a valid choice.\0"
	.text
	.globl	_updateAccountDetails
	.def	_updateAccountDetails;	.scl	2;	.type	32;	.endef
_updateAccountDetails:
LFB65:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC17, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	cmpl	$0, -16(%ebp)
	je	L245
	cmpl	$0, -20(%ebp)
	jne	L246
L245:
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L246:
	movl	$LC29, (%esp)
	call	_printf
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	jmp	L247
L262:
	movl	_ACC+20, %edx
	movl	-24(%ebp), %eax
	cmpl	%eax, %edx
	jne	L248
	movl	$10, (%esp)
	call	_putchar
	movl	$_ACC, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	movl	_ACC+68, %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	_ACC+36, %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	_ACC+40, %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	movzbl	_ACC+76, %eax
	cmpb	$83, %al
	jne	L249
	movl	$LC10, %eax
	jmp	L250
L249:
	movl	$LC11, %eax
L250:
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	flds	_ACC+72
	fstpl	4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movl	$LC195, (%esp)
	call	_printf
	movl	$LC196, (%esp)
	call	_printf
	movl	$LC197, (%esp)
	call	_printf
	movl	$LC198, (%esp)
	call	_printf
	movl	$LC199, (%esp)
	call	_printf
	movl	$LC200, (%esp)
	call	_printf
L261:
	movl	$LC201, (%esp)
	call	_printf
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	-28(%ebp), %eax
	cmpl	$5, %eax
	ja	L251
	movl	L253(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L253:
	.long	L251
	.long	L257
	.long	L256
	.long	L255
	.long	L254
	.long	L252
	.text
L257:
	movl	$LC202, (%esp)
	call	_printf
	movl	$_ACC, 4(%esp)
	movl	$LC38, (%esp)
	call	_scanf
	movl	$LC203, (%esp)
	call	_printf
	jmp	L258
L256:
	movl	$LC204, (%esp)
	call	_printf
	movl	$_ACC+68, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	movl	$LC205, (%esp)
	call	_printf
	jmp	L258
L255:
	movl	$LC206, (%esp)
	call	_printf
	movl	$_ACC+36, 4(%esp)
	movl	$LC30, (%esp)
	call	_scanf
	movl	$LC207, (%esp)
	call	_printf
	jmp	L258
L254:
	movl	$LC208, (%esp)
	call	_printf
	movl	$_ACC+40, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	$LC209, (%esp)
	call	_printf
	jmp	L258
L252:
	movl	$LC210, (%esp)
	call	_printf
	movzbl	_ACC+76, %eax
	cmpb	$83, %al
	jne	L259
	movb	$67, _ACC+76
	jmp	L258
L259:
	movb	$83, _ACC+76
	jmp	L258
L251:
	movl	$LC211, (%esp)
	call	_printf
L258:
	movl	-28(%ebp), %eax
	testl	%eax, %eax
	jle	L261
	movl	-28(%ebp), %eax
	cmpl	$5, %eax
	jg	L261
	movl	$1, -12(%ebp)
L248:
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
L247:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L262
	cmpl	$0, -12(%ebp)
	jne	L263
	movl	$LC87, (%esp)
	call	_printf
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	jmp	L244
L263:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC17, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -20(%ebp)
	jmp	L265
L266:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fwrite
L265:
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L266
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC18, (%esp)
	call	_remove
L244:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE65:
	.section .rdata,"dr"
LC212:
	.ascii "\12Customer Number:     %d\0"
LC213:
	.ascii "\12Name:                %s\0"
LC214:
	.ascii "\12Mobile Number:       %ld\0"
LC215:
	.ascii "\12Account Number:      %ld\0"
LC216:
	.ascii "\12I.D. Number:         %ld\0"
LC217:
	.ascii "\12Age:                 %d\0"
LC218:
	.ascii "\12Type of account:     %s\0"
LC219:
	.ascii "Yes\0"
LC220:
	.ascii "No\0"
LC221:
	.ascii "\12Account blocked:     %s\0"
	.text
	.globl	_viewCustomersList
	.def	_viewCustomersList;	.scl	2;	.type	32;	.endef
_viewCustomersList:
LFB66:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$1, -12(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	L270
	movl	$LC3, (%esp)
	call	_puts
	jmp	L267
L275:
	movl	$10, (%esp)
	call	_putchar
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	movl	%eax, 4(%esp)
	movl	$LC212, (%esp)
	call	_printf
	movl	$_ACC, 4(%esp)
	movl	$LC213, (%esp)
	call	_printf
	movl	_ACC+68, %eax
	movl	%eax, 4(%esp)
	movl	$LC214, (%esp)
	call	_printf
	movl	_ACC+20, %eax
	movl	%eax, 4(%esp)
	movl	$LC215, (%esp)
	call	_printf
	movl	_ACC+36, %eax
	movl	%eax, 4(%esp)
	movl	$LC216, (%esp)
	call	_printf
	movl	_ACC+40, %eax
	movl	%eax, 4(%esp)
	movl	$LC217, (%esp)
	call	_printf
	movzbl	_ACC+76, %eax
	cmpb	$83, %al
	jne	L271
	movl	$LC10, %eax
	jmp	L272
L271:
	movl	$LC11, %eax
L272:
	movl	%eax, 4(%esp)
	movl	$LC218, (%esp)
	call	_printf
	flds	_ACC+72
	fstpl	4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movzbl	_ACC+84, %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L273
	movl	$LC219, %eax
	jmp	L274
L273:
	movl	$LC220, %eax
L274:
	movl	%eax, 4(%esp)
	movl	$LC221, (%esp)
	call	_printf
L270:
	movl	-16(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$96, 4(%esp)
	movl	$_ACC, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L275
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
L267:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE66:
	.section .rdata,"dr"
LC222:
	.ascii "\12"
	.ascii "1. View all trabsactions\0"
	.align 4
LC223:
	.ascii "\12"
	.ascii "2. View transactions of a particular day\0"
	.align 4
LC224:
	.ascii "\12"
	.ascii "3. View transactions by month\0"
LC225:
	.ascii "\12"
	.ascii "4. View transactions by year\0"
LC226:
	.ascii "\12Enter the day: \0"
LC227:
	.ascii "\12Enter the month: \0"
LC228:
	.ascii "\12Enter the year: \0"
LC229:
	.ascii "\12Enter a valid choice.\0"
	.align 4
LC230:
	.ascii "\12\12There are total %d transcations made.\0"
	.text
	.globl	_viewLedger
	.def	_viewLedger;	.scl	2;	.type	32;	.endef
_viewLedger:
LFB67:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$1, -28(%ebp)
	movl	$1, -32(%ebp)
	movl	$LC1, 4(%esp)
	movl	$LC24, (%esp)
	call	_fopen
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	L277
	movl	$LC3, (%esp)
	call	_puts
	movl	$1, (%esp)
	call	_exit
L277:
	movl	$LC222, (%esp)
	call	_printf
	movl	$LC223, (%esp)
	call	_printf
	movl	$LC224, (%esp)
	call	_printf
	movl	$LC225, (%esp)
	call	_printf
	movl	$LC201, (%esp)
	call	_printf
	leal	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movl	-40(%ebp), %eax
	cmpl	$4, %eax
	je	L278
	cmpl	$4, %eax
	jg	L279
	cmpl	$3, %eax
	je	L280
	cmpl	$3, %eax
	jg	L279
	cmpl	$1, %eax
	je	L281
	cmpl	$2, %eax
	je	L282
	jmp	L279
L281:
	movl	$0, -32(%ebp)
	jmp	L283
L282:
	movl	$0, -32(%ebp)
	movl	$LC226, (%esp)
	call	_printf
	leal	-44(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	jmp	L283
L280:
	movl	$0, -32(%ebp)
	movl	$LC227, (%esp)
	call	_printf
	leal	-48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	jmp	L283
L278:
	movl	$0, -32(%ebp)
	movl	$LC228, (%esp)
	call	_printf
	leal	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	jmp	L283
L279:
	movl	$LC229, (%esp)
	call	_printf
	movl	$1, -32(%ebp)
	nop
L283:
	cmpl	$0, -32(%ebp)
	jne	L277
	call	_printHeader
	jmp	L284
L293:
	movl	-40(%ebp), %eax
	cmpl	$2, %eax
	jne	L285
	movl	_LL, %edx
	movl	-44(%ebp), %eax
	cmpl	%eax, %edx
	je	L286
L285:
	movl	-40(%ebp), %eax
	cmpl	$3, %eax
	jne	L287
	movl	_LL+4, %edx
	movl	-48(%ebp), %eax
	cmpl	%eax, %edx
	je	L286
L287:
	movl	-40(%ebp), %eax
	cmpl	$4, %eax
	jne	L288
	movl	_LL+8, %edx
	movl	-52(%ebp), %eax
	cmpl	%eax, %edx
	je	L286
L288:
	movl	-40(%ebp), %eax
	cmpl	$1, %eax
	jne	L284
L286:
	flds	_LL+40
	flds	_LL+36
	movzbl	_LL+32, %eax
	cmpb	$87, %al
	je	L289
	movzbl	_LL+32, %eax
	cmpb	$68, %al
	jne	L290
	fxch	%st(1)
	movl	$LC25, %ecx
	jmp	L292
L290:
	fxch	%st(1)
	movl	$LC26, %ecx
	jmp	L292
L289:
	fxch	%st(1)
	movl	$LC27, %ecx
L292:
	movl	_LL+28, %esi
	movl	_LL+24, %eax
	movl	%eax, -60(%ebp)
	movl	_LL+8, %ebx
	movl	%ebx, -64(%ebp)
	movl	_LL+4, %edi
	movl	%edi, -68(%ebp)
	movl	_LL, %edx
	movl	%edx, -72(%ebp)
	movl	_LL+12, %ebx
	movl	%ebx, -76(%ebp)
	movl	_LL+16, %edi
	movl	_LL+20, %ebx
	movl	-28(%ebp), %edx
	leal	1(%edx), %eax
	movl	%eax, -28(%ebp)
	fstpl	56(%esp)
	fstpl	48(%esp)
	movl	%ecx, 44(%esp)
	movl	%esi, 40(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 36(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, 32(%esp)
	movl	-68(%ebp), %eax
	movl	%eax, 28(%esp)
	movl	-72(%ebp), %eax
	movl	%eax, 24(%esp)
	movl	-76(%ebp), %eax
	movl	%eax, 20(%esp)
	movl	%edi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$LC28, 4(%esp)
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, (%esp)
	call	_fprintf
L284:
	movl	-36(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$1, 8(%esp)
	movl	$44, 4(%esp)
	movl	$_LL, (%esp)
	call	_fread
	testl	%eax, %eax
	jne	L293
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	-28(%ebp), %eax
	subl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$LC230, (%esp)
	call	_printf
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
	nop
	addl	$140, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE67:
	.section .rdata,"dr"
LC231:
	.ascii "\12Invalid choice.\0"
	.text
	.globl	_SelectOptionEmployee
	.def	_SelectOptionEmployee;	.scl	2;	.type	32;	.endef
_SelectOptionEmployee:
LFB68:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	call	_clearscr
	movsbl	-12(%ebp), %eax
	cmpl	$8, %eax
	ja	L295
	movl	L297(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L297:
	.long	L295
	.long	L304
	.long	L303
	.long	L302
	.long	L301
	.long	L300
	.long	L306
	.long	L306
	.long	L306
	.text
L304:
	call	_viewCustomersList
	jmp	L294
L303:
	call	_viewLedger
	jmp	L294
L302:
	call	_viewAccountsBlocked
	jmp	L294
L301:
	call	_closeAccountRequest
	jmp	L294
L300:
	call	_unblockAccount
	jmp	L294
L295:
	movl	$LC231, (%esp)
	call	_printf
	jmp	L294
L306:
	nop
L294:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE68:
	.globl	_SelectOptionCustomer
	.def	_SelectOptionCustomer;	.scl	2;	.type	32;	.endef
_SelectOptionCustomer:
LFB69:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movb	%al, -12(%ebp)
	call	_clearscr
	movsbl	-12(%ebp), %eax
	cmpl	$7, %eax
	ja	L308
	movl	L310(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L310:
	.long	L308
	.long	L316
	.long	L315
	.long	L314
	.long	L313
	.long	L318
	.long	L311
	.long	L318
	.text
L316:
	call	_addNewAccount
	jmp	L307
L315:
	call	_updateAccountDetails
	jmp	L307
L314:
	call	_sendOrReceiveMoney
	jmp	L307
L313:
	call	_checkAccountDetails
	jmp	L307
L311:
	call	_closeAccount
	jmp	L307
L308:
	movl	$LC231, (%esp)
	call	_printf
	jmp	L307
L318:
	nop
L307:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE69:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC232:
	.ascii "admin\0"
	.align 4
LC233:
	.ascii "\12Admin Authorisation Request denied!\0"
LC234:
	.ascii "Please enter a valid choice.\0"
	.align 4
LC235:
	.ascii "Thank you for using the app. Have a nice day :)\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB70:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$1, 4(%esp)
	movl	$10, (%esp)
	call	_calloc
	movl	%eax, 36(%esp)
	movl	$0, 44(%esp)
L329:
	call	_clearscr
	movl	$0, 44(%esp)
	call	_LoginMenu
	leal	23(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	call	_clearscr
	movzbl	23(%esp), %eax
	cmpb	$1, %al
	jne	L320
	nop
L321:
	call	_clearscr
	movl	$LC31, (%esp)
	call	_printf
	movl	$0, 40(%esp)
	addl	$1, 44(%esp)
	jmp	L322
L323:
	movl	40(%esp), %edx
	movl	36(%esp), %eax
	addl	%eax, %edx
	movzbl	35(%esp), %eax
	movb	%al, (%edx)
	addl	$1, 40(%esp)
	movl	__imp___iob, %eax
	addl	$32, %eax
	movl	%eax, 4(%esp)
	movl	$42, (%esp)
	call	_fputc
L322:
	call	_getch
	movb	%al, 35(%esp)
	cmpb	$32, 35(%esp)
	jne	L323
	movl	$10, (%esp)
	call	_putchar
	movl	40(%esp), %edx
	movl	36(%esp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC232, (%esp)
	call	_strcmp
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_LoadingPage
	cmpl	$2, 44(%esp)
	jg	L324
	cmpl	$0, 28(%esp)
	je	L324
	jmp	L321
L324:
	movl	36(%esp), %eax
	movl	%eax, 24(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	___mingw_free
	nop
	cmpl	$3, 44(%esp)
	jne	L325
	movl	$LC233, (%esp)
	call	_printf
	movl	$LC33, (%esp)
	call	_printf
	call	_getch
	jmp	L326
L325:
	call	_PrintMenuEmployee
	leal	22(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movzbl	22(%esp), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_SelectOptionEmployee
	call	_clearscr
	movzbl	22(%esp), %eax
	cmpb	$8, %al
	jne	L325
	jmp	L326
L320:
	movzbl	23(%esp), %eax
	cmpb	$2, %al
	jne	L327
L328:
	call	_PrintMenuCustomer
	leal	22(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_scanf
	movzbl	22(%esp), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_SelectOptionCustomer
	call	_clearscr
	movzbl	22(%esp), %eax
	cmpb	$7, %al
	jne	L328
	jmp	L326
L327:
	movzbl	23(%esp), %eax
	cmpb	$3, %al
	je	L326
	movl	$LC234, (%esp)
	call	_printf
L326:
	movzbl	23(%esp), %eax
	cmpb	$3, %al
	jne	L329
	movl	$LC235, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE70:
	.section .rdata,"dr"
	.align 4
LC61:
	.long	1148846080
	.align 4
LC64:
	.long	1157234688
	.align 4
LC68:
	.long	1140457472
	.align 4
LC90:
	.long	1120403456
	.align 4
LC104:
	.long	1082130432
	.align 4
LC105:
	.long	1094713344
	.align 4
LC121:
	.long	1150681088
	.align 4
LC124:
	.long	1223959552
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	_GetStdHandle@4;	.scl	2;	.type	32;	.endef
	.def	_GetConsoleScreenBufferInfo@8;	.scl	2;	.type	32;	.endef
	.def	_SetConsoleTextAttribute@8;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fread;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_getch;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	_rewind;	.scl	2;	.type	32;	.endef
	.def	_fflush;	.scl	2;	.type	32;	.endef
	.def	_remove;	.scl	2;	.type	32;	.endef
	.def	_rename;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	___mingw_free;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_localtime;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_getchar;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
