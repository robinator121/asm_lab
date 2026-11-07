.data
.balign 4
arr: .word 10, 20, 30, 40, 50

.text
.global _start
_start:
    ldr x0, =arr
    mov x1, #0
    mov w2, #0

loop:
    ldr w3, [x0, x1, lsl #2]
    add w2, w2, w3
    add x1, x1, #1
    cmp x1, #5
    b.ne loop

    // w2 = 150. very nice. now bonus: biggest element using NEON
    // 5 elements, so 4 in SIMD and last one separately. no illegal memory adventures
    ldr x0, =arr
    ld1 {v0.4s}, [x0]
    smaxv s1, v0.4s
    umov w4, v1.s[0]
    ldr w5, [x0, #16]
    cmp w4, w5
    csel w0, w4, w5, gt

    mov x8, #93
    svc #0
