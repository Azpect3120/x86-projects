section .data
  pathname DD "/home/azpect/Documents/Projects/x86/filesystem/created.txt"
  data DD "Hello, world! This file wasc created using x86 assembly.", 0x0a

section .text
global main

main:
  MOV eax, 5
  MOV ebx, pathname
  MOV ecx, 0o101           ; ocatal value for open/create flags
  MOV edx, 0o700           ; octal value for file permissions
  INT 0x80

  MOV ebx, eax
  MOV eax, 4
  MOV ecx, data
  MOV edx, 57
  INT 0x80

  MOV eax, 1
  MOV ebx, 0
  INT 0x80
