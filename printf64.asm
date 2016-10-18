; 
; calling c library functions using x86_64 calling conventions 
;
SECTION .text

extern printf
global main

%define pushq push qword
%define popq pop qword

main: 
  pushq rbp
  mov rbp, rsp

  mov rdi, msg ; this is different to x86, in x64, use registers for func args

  call printf ; call pushes return address on to stack

  mov rsp, rbp
  popq rbp
  ret ; popq RIP

SECTION .data
msg: db "Hello, world!", 10, 0

