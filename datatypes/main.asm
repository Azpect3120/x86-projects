section .bss
  ; Reserve 3 byte of memory
  num RESB 3
  

section .data
  ; One character (1 byte)
  char DB 'A'

  ; List of 4 characters (4 bytes, one for each character)
  ; Lists typically require some kind of character to end the list (like a null terminator)
  list DB 1, 2, 3, 4

  ; Strings are lists of characters with a null terminator
  string1 DB "ABC", 0
  string2 DB "DEF", 0

  ; Reserve 3 bytes of memory and initialize them to 2
  num2 DB 3 DUP(2)

section .text

global _start

_start:
  ; Exit the program with the character in the register bl
  ; MOV bl, [char]
  ; MOV eax, 1
  ; INT 0x80

  ; Load the string into the register bl and exit the program
  ; Just so we can see the address and look at the memory
  ; MOV bl, [string1]
  ; MOV eax, 1
  ; INT 0x80

  MOV bl, 1
  MOV [num], bl

  ; Offsets can be used to access memory at locations relative to the base address
  MOV [num+1], bl  
  MOV [num+2], bl

  MOV cl, 3
  MOV [num2], cl

  MOV eax, 1
  INT 0x80
  
  
