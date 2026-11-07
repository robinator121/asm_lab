.data
.balign 4
arr:
    .word -100, -30, -500, -2

.text
.global _start

_start:
    ldr x0, =arr
    mov x1, #0
    ldr w2, [x0], #4
    add x1, x1, #1

loop:
    ldr w3, [x0], #4
    add x1, x1, #1
    cmp w2, w3
    csel w2, w2, w3, gt
    cmp x1, #4
    b.ne loop

done:
    mov w0, w2
    mov x8, #93
    svc #0
