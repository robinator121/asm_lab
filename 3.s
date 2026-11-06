.data
.balign 4
arr: .word 10, 20, 30, 40, 50
.global _start
_start:
    mov x0, =arr
    mov w1, #0
    mov w2, #0

loop:
    ldr, w3, [x0, w1, lsl #2]
    add w2,w2, w3
    add w1, w1, #1
    cmp w1, #5
    b.ne loop

done:
    mov x0, x2
    mov x8, #93
    svc #0


//bonus, lets try finding the biggest element in the array

_start:
    ldr x0, =arr
    ld1 {v0.4s}, [x0]
    add x1, x0, #4
    ld1 {v1.4s}, [x1]
    smax v2.4s, v0.4s, v1.4s
    smaxv s0, v2.4s
    fmov w0, s0
    mov x8, #93
    svc #0
