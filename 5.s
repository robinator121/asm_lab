.data
.balign 16
arr:
    .word -30, 5, 12, 8
    .word -4, 25, -11, 33
    .word 16, -70, 44, 2
    .word -8, 73, 9, -1

.text
.global _start

_start:
    ldr x0, =arr

    ld1 {v0.4s}, [x0], #16

    mul v0.4s, v0.4s, v0.4s // first row
    mov w1, #3

loop:
    ld1 {v1.4s}, [x0], #16
    mla v0.4s, v0.4s, v1.4s // v0 += v1 * v1, multiply accumulate. better than mul and add because its just one liner. but i do wonder if this is faster than mul and add

    subs w1, w1, #1
    b.ne loop

done:
    addv s2, v0.4s
    fmov w0, s2

    mov x8, #93
    svc #0
