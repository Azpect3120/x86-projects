; Import the C functions
; Tell nasm they are external
extern printf
extern exit

section .data
  msg DD "Hello World!", 0x0a, 0
  msg2 DD "Hi mom! :)", 0
  fmt DD "Output is: %s%s", 0x0a, 0

section .text
global main

; printf(fmt, msg)
; exit(1)

; _start was renamed to main so the GCC can read it
main:
  ; Push the arguments to the stack
  ; Stacks are last in first out data structures so they are loaded backwards
  PUSH msg2
  PUSH msg 
  PUSH fmt
  CALL printf     ; Call the printf function (must match the name in the C code)

  PUSH 1          ; Push the exit code to the stack
  CALL exit       ; Call the exit function (must match the name in the C code)
