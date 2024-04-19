; The purpose of this program is to demonstrate the use of the lseek system call 
; to read a file record by record. The target file is the `lseek_data.txt` file 
; found in this directory. The file contains 6 records, each record is 10 bytes.
section .data
  pathname DD "/home/azpect/Documents/Projects/x86/filesystem/lseek_data.txt"

section .bss
  buffer RESB 10

section .text
global main 

main:
  ; Get the file descriptor from and store it in eax
  ; Same code as found in `main.asm`
  MOV eax, 5
  MOV ebx, pathname
  MOV ecx, 0
  INT 0x80

  ; lseek man page: 
  ; Values for the WHENCE argument to lseek.
  ; ifndef        _STDIO_H                /* <stdio.h> has the same definitions.  */
    ; define SEEK_SET        0        /* Seek from beginning of file.  */
    ; define SEEK_CUR        1        /* Seek from current position.  */
    ; define SEEK_END        2        /* Seek from end of file.  */
    ; ifdef __USE_GNU
    ;  define SEEK_DATA        3        /* Seek to next data.  */
    ;  define SEEK_HOLE        4        /* Seek to next hole.  */
    ; endif
  ;endif
  MOV ebx, eax      ; Store the file descriptor in ebx
  MOV eax, 19       ; lseek syscall number
  MOV ecx, 20       ; Offset to seek
  MOV edx, 0        ; SEEK_SET
  INT 0x80
  
  ; Read the files 3rd record as defined by the 20 byte offset
  MOV eax, 3        ; sys_read syscall number
  MOV ecx, buffer   ; Buffer to store the read data
  MOV edx, 10       ; Number of bytes to read
  INT 0x80

  MOV eax, 1
  MOV ebx, 0
  INT 0x80

