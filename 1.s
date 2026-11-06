
.section .text
.global _start

_start:
    sub sp, sp, #16

    mov w0, #106
    sub w1, w0, #4
    strb w1, [sp]

    sub w2, w1, #5
    strb w2, [sp, #1]

    add w3, w2, #17
    strb w3, [sp, #2]

    add w4, w3, #2
    strb w4, [sp, #3]

    mov x0, #1
    mov x1, sp
    mov x2, #4
    mov x8, #64
    svc #0

    add sp, sp, #16

    mov x0, #0
    mov x8, #93
    svc #0
