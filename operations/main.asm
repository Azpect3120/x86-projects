section .data
section .text
global _start

_start:
  ; ADDITION
  ; ==================================================================
  ; MOV eax, -3
  ; MOV ebx, 1
  ; ADD eax, ebx   ; destination, source: eax = eax + ebx
  ; INT 0x80

  ; Adding with overflow and carry bits
  ; MOV al, 0b11111111 ; 0xFF
  ; MOV bl, 0b00000001 ; 0x01
  ; ADD al, bl
  ; ADC ah, 0          ; add carry flag to high byte, if al overflows it will be 0 and the carry flag will be set
  ; INT 0x80


  ; SUBTRACTION
  ; ==================================================================
  ; MOV eax, 3
  ; MOV ebx, 5
  ; SUB eax, ebx   ; destination, source: eax = eax - ebx
  ; INT 0x80
  ; Resulting EFLAGS register: 0b 00 10 10 01 00 11 or 0x293  (CF, AF, SF, IF)


  ; MULTIPLICATION
  ; ==================================================================
  ; MOV al, 0xFF  ; If a value overflows, the destination register will be expanded to fit the size of the product
  ; MOV bl, 2
  ; MUL bl     ; source, (operand is in the a register): al = al * bl
  ; INT 0x80

  ; MUL will result in 510
  ; IMUL will result in -2
  ; This is because the value stored with 0xFF is determined to be -1 when using IMUL whereas MUL it
  ; it is determined to be 255.
 
  ; DIVISION
  ; ==================================================================
  ; 11 / 2 = 5 remainder 1
  ; MOV eax, 11
  ; MOV ecx, 2
  ; DIV ecx   ; source, (operand is in the a register, remained in the d register): eax = eax / ecx, edx = eax % ecx
  ; INT 0x80

  ; IDIV vs DIV has the same issue as the IMUL vs MUL issue.


  ; LOGICAL OPERATORS
  ; ==================================================================
  MOV eax, 0b1010
  MOV ebx, 0b1100
  AND eax, ebx          ; destination, source: eax = eax & ebx 

  MOV eax, 0b1010
  MOV ebx, 0b1100
  OR eax, ebx           ; destination, source: eax = eax | ebx

  ; The NOT instruction will flip ALL bits in the register 
  ; Using AND like this will flip all bits back except the last 4 (which are the ones we want to keep flipped)
  ; This is called a mask, we are using it to keep the last 4 bits flipped and the rest of the bits the same
  MOV eax, 0b1010
  NOT eax               ; destination: eax = !eax
  AND eax, 0b00001111   ; destination, source: eax = eax & 0b00001111

  MOV eax, 0b1010
  MOV ebx, 0b1100
  XOR eax, ebx          ; destination, source: eax = eax ^ ebx

  INT 0x80

