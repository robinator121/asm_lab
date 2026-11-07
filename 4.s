// hmm yes i like NEON. lets do more. this time without reading into the abyss
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
    mov w1, #3 // 16 ints = 4 groups of 4, already loaded one

loop:
    ld1 {v1.4s}, [x0], #16
    smax v0.4s, v0.4s, v1.4s
    subs w1, w1, #1
    b.ne loop

done:
    smaxv s2, v0.4s // find biggest lane. should be 73
    umov w0, v2.s[0] // copy bits from SIMD into normal register
    mov x8, #93
    svc #0
