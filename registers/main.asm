section .data
  num1 db 1
  num2 db 2


section .text
global _start

_start:
  mov bl, [num1]
  mov bh, [num2]
  mov eax, 1
  int 0x80
  
