;
; calling c function using x86 32 bit calling conventions
;

SECTION .text

extern printf
global main

main: 
  push ebp
  mov ebp, esp
  push msg

  call printf

  mov esp, ebp
  pop ebp
  ret

SECTION .data
msg: db "Hello, world!", 10, 0

