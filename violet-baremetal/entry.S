.section .text.entry

.globl _start
_start:
    li sp, 0x10000
    call main

_end:
    j _end
