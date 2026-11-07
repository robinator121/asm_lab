# asm_lab
tldr: i like assembly. i like arm. why not do both?
this repo is my practice and exploration of arm asm
all of this code is 100% written by hand. my hands
(ai gave me exercises and answered my dumb questions. the code is mine, the bugs were also mine)


btw, NEON is really cool

the project contains files
these files are the following (the files may be subject to change. this is github.)

| file | what it does | result |
|------|--------------|--------|
| 1.s | builds a word from arithmetic on the stack, prints it. very mature | prints `fart` |
| 2.s | add/sub/mul/div/madd/and/orr/eor/shifts into an array, then fart again | prints `fart`, exit 0 |https://github.com/robinator121/asm_lab/edit/main/README.md
| 3.s | sum of array in loop, then max with NEON + scalar tail for 5th element | exit 50 |
| 4.s | NEON max over 16 ints with `smax` + `smaxv` | exit 73 |
| 5.s | NEON sum of squares with `mla` + `addv` | exit 195 (15555, but exit code is only 8 bits) |
| 6.s | scalar max with `csel`, branchless, all negative numbers | exit 254 (that is -2, trust me) |
| 7.s | count lowercase 'a', reverse string in place with two pointers | prints `rossecorp MRA derewop-tsaf`, exit 1 |

how to run:
idk,  
aarch64-linux-gnu-as 4.s -o 4.o
aarch64-linux-gnu-ld 4.o -o 4
qemu-aarch64 ./4; echo $?
if it doesnt work, try checking your packages and maybe turning your pc off and on. (if you try running this on a computer thats turned off, please leave)

fyi:
this is my own personal area where i try, play and break computers (or my own sanity)
please note that my unprofessional notes here are unprofessional because these are not meant to be in a professional capacity. professional capacity is professionally handled. userspace and kernelspace remains separated.

also, what i learnt will be added after i learnt it
