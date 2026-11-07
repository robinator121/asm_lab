.data
message:
    .asciz "fast-powered ARM processor"
newline:
    .ascii "\n"

.text
.global _start
_start:
    ldr x5, =message
    mov x0, x5

// first find end. x0 points AFTER the zero byte once this finishes
find_end:
    ldrb w2, [x0], #1
    cbnz w2, find_end
    mov x7, x0 // save end+1 so write knows length later
    sub x6, x0, #2 // last real character, not the null byte

    // count lowercase 'a'. uppercase ARM does not count
    mov x0, x5
    mov w9, #0
acount:
    ldrb w2, [x0], #1
    cbz w2, replace
    cmp w2, #97
    b.ne acount
    add w9, w9, #1
    b acount

// now reverse the bytes. x0 walks right, x1 walks left
replace:
    mov x0, x5
    mov x1, x6
swap:
    cmp x0, x1
    b.hs finish
    ldrb w3, [x0]
    ldrb w4, [x1]
    strb w4, [x0]
    strb w3, [x1]
    add x0, x0, #1
    sub x1, x1, #1
    b swap

finish:
    mov x0, #1
    mov x1, x5
    sub x2, x7, x5
    sub x2, x2, #1 // do not print the null byte
    mov x8, #64
    svc #0

    mov x0, #1
    ldr x1, =newline
    mov x2, #1
    mov x8, #64
    svc #0

    // $? = number of lowercase a's (1 here)
    mov w0, w9
    mov x8, #93
    svc #0

// neon idea but neon problem: length must be known before loading 16 bytes
// so do 16-byte chunks ONLY while 16 bytes remain. scalar handles tail
