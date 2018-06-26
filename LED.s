
;@---------------------
.cpu cortex-m0
.thumb
;@---------------------
.thumb_func
.globl initLED
initLED:
    push {r7, lr}
    add r7, sp, #0
    movs r2, #0x43
    lsl r2, #8
    add r2, r2, #0x90
    lsl r2, #8
    add r2, r2, #0x08
    lsl r2, #8
    add r2, r2, #0xB4       //Address 0x439008B4
    movs r3, #1
    str r3, [r2,#0]
    movs r3, #0xC
    movs r2, #0x40
    lsl r2, #16
    add r2, r2, #0x60
    lsl r2, r2, #8
    add r2, r2, #0x90      //Address 0x40006090
    str r3, [r2, #0x14]     //Write 0xC to 0x40006094 the DOUTCLR
    movs r3, #0x44
    lsl r3, #8
    str r3, [r2, #0x4]      //Write 0x4400 to 0x40006084 the MODEL sets pin
    mov sp,r7
    pop {r7,pc}
;@---------------------
.thumb_func
.globl LED
LED:
    push {r7, lr}
    add r7, sp, #0
    movs r2, #0x40
    lsl r2, #16
    add r2, r2, #0x60
    lsl r2, r2, #8
    add r2, r2, #0x90      //Address 0x40006090
    movs r3, #0x8
    str r3, [r2, #0x14]
    movs r3, #0x1
    and r3, r0, r3          //If 1 then ...
    lsl r3, r3, #3          //0x8 or 0x0
    str r3, [r2, #0x10]       //Write 0x8 to 0x40006090 the DOUTSET pin
    movs r3, #0x4
    str r3, [r2, #0x18]     //Toggle second LED
    movs r2, #0
    movs r3, #0
    mov sp,r7
    pop {r7,pc}
;@-----------------------
.end
;@-----------------------
