// hmm yes i like NEON. lets do more
.data
.balign 16
.arr:
    .word -30, 5, 12, 8
    .word -4, 25, -11, 33
    .word 16, -70, 44, 2
    .word -8, 73, 9, -1

.text
.global _start

_start:
    ldr x0, =arr //why not mov?. because ldr asks gnu asmsmebler

    ld1 {v0.4s}, [x0], #16

    mov w1, #3

loop:
    ld1 {v0.4s}, [x0], #16
    ld1 {v1.4s}, [x0], #16 // we go 16 bytes left thanks
    smax 0.4s, 0.4s, v1.4s
    sub w1, #1
    cmp w1, 0
    b.ne loop

done:
    smaxv s0, v2.4s // i dont fully understand this but whatever -> basically, this finds maximum value within one vector. extremely useful if we try to find biggest byte within a simd thingy, or idk, whatever, still, useful
    fmov w0, s0 // whats the difference between this and mov? fuckmov? -> floating point mov. it copies 32 bit pattern from simd register. so its basically simd to regular register. an alternative is umov w0, 0.s[0] so we basically treat the vector as an array. very nice
    svc #0
