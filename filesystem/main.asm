section .data
  pathname DD "/home/azpect/Documents/Projects/x86/filesystem/main.asm"
  fmt DD "%s", 0x0a, 0x00

section .bss
  ; Create a buffer to store the file contents
  ; All this really does is reserve 1024 bytes of memory
  buffer RESB 2048

section .text

extern printf
global main

; Open file man page: https://man7.org/linux/man-pages/man2/open.2.html
; fcntl man page: https://sites.uclouvain.be/SystInfo/usr/include/asm-generic/fcntl.h.html

main:
  ; Open the file in read-only mode and store the file descriptor in eax
  MOV eax, 0x05            ; sys_open syscall number
  MOV ebx, pathname        ; pointer to the pathname
  MOV ecx, 0x00            ; O_RDONLY flag
  INT 0x80

  ; Read the file using the descriptor stored in eax
  ; The number of bytes read will be returned into eax
  MOV ebx, eax             ; store the file descriptor in ebx
  MOV ecx, buffer          ; store the buffer address in ecx
  MOV edx, 2048            ; store the number of bytes to read in edx
  INT 0x80

  ; Print the output of the file
  PUSH buffer
  PUSH fmt
  CALL printf

  ; Close the file
  MOV eax, 0x06            ; sys_close syscall number
  MOV ebx, eax             ; store the file descriptor in ebx
  INT 0x80

  ; Exit the program
  MOV eax, 0x01            ; sys_exit syscall number
  MOV ebx, 0x00            ; exit code
  INT 0x80
