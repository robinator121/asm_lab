.data
message:
    .asciz "fast-powered ARM processor"

.text
.global _start
    ldr x0, =message
    ldr x5, =message

loop:
    ldrb w2, [x0], #1 // what does it mean? we advance pointer itself? -> yes
    cbnz w2, loop

    mov x0, x5
    mov w3, #0 // a is 97, this is counter

plus:
    add w3, w3, #1
    b acount

acount:
    ldrb w2, [x0], #1
    sub w2, 97
    cbz w2, plus
    add w2, 97
    cbz w2, finish

reset:
    mov x5, x0

replace:
    b loop
    mov w4, #0
    mov w3, #0
    mov w6, #0
    ldrb w3, [x0], w4
    ldrb w6, [x5], w4
    strb w6, [x0], w4
    strb w3, [x5], w4
    add w4, w4, #1



//end of code stuff wont be written here because the loops themselves would mess up addressing. in loop, we would basically return the sub x5, x0

//neon idea but neon problem. we read multiple bytes at the same time, very cool yes. but what if array is smaller than 4 or **is not divisible by 4???**
