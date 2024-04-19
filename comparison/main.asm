section .data

section .text
global _start

_start:
  ; The CMP instruction subtracts the second operand from the first operand but does not store the result
  ; Instead, it sets the flags in the EFLAGS register based on the result of the subtraction
  ; If the first operand is less than the second operand, the result will be negative (though discarded)
  ; If the first operand is greater than the second operand, the result will be positive (though discarded)
  ; If the two operands are equal, the ZF flag is set to 1
  MOV eax, 3
  MOV ebx, 4
  CMP eax, ebx
  JL lesser         ; Jump if less-than
  ; JLE             ; Jump if less-than or equal
  ; JG              ; Jump if greater-than
  ; JGE             ; Jump if greater-than or equal
  ; JE              ; Jump if equal (basically the same as JZ)
  ; JNE             ; Jump if not equal
  ; JZ              ; Jump if zero (basically the same as JE)

  ; This is needed to prevent the program from executing the code that should only 
  ; be executed if the condition is true
  JMP end

lesser:
  MOV ecx, 1

end:
  INT 0x80
