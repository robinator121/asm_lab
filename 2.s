//.global _start
//_start:
	//mov x0, #120
	//mov x1, 7
	//add x2, x1, x0
	//sub x3, x0, x1
	//mul x4, x0, x1
	//ok this isnt working
	//lets make an array instead
	


.data
.balign 4 // IMPORTANT, GNU MAKES SURE ADDRESS IS DIVISIBLE BY 4!!!!
arr:    .space 44
txt:    .space 5

.text
.global _start

_start:
    mov w0, #120
    mov w1, #7
    ldr x2, =arr
    mov x3, #0              // array index

    add w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    sub w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    mul w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    sdiv w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    udiv w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    ldr w5, [x2]            // load arr[0]
    madd w4, w0, w1, w5
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    and w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    orr w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    eor w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    lsl w4, w0, w1
    str w4, [x2, x3, lsl #2]
    add x3, x3, #1

    lsr w4, w0, w1
    str w4, [x2, x3, lsl #2]

    // construct message
    ldr x2, =txt

    mov w4, #106
    sub w4, w4, #4          // f = 102
    strb w4, [x2]

    sub w4, w4, #5          // a = 97
    strb w4, [x2, #1]

    add w4, w4, #17         // r = 114
    strb w4, [x2, #2]

    add w4, w4, #2          // t = 116
    strb w4, [x2, #3]

    mov w4, #10             // newline
    strb w4, [x2, #4]

    // write(1, txt, 5)
    mov x0, #1
    mov x1, x2
    mov x2, #5
    mov x8, #64
    svc #0

    // exit(0)
    mov x0, #0
    mov x8, #93
    svc #0

