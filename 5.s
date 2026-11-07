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
    mul v0.4s, v0.4s, v0.4s // first 4 squared
    mov w1, #3

loop:
    ld1 {v1.4s}, [x0], #16
    mla v0.4s, v1.4s, v1.4s // v0 += v1 * v1. not v0 * v1. i did that before lol
    subs w1, w1, #1
    b.ne loop

done:
    addv s2, v0.4s // sum of squares should be 15555
    umov w0, v2.s[0]
    // exit status is only 8 bits, so shell shows 195. not the whole 15555
    mov x8, #93
    svc #0
