section .data
  list DB 1, 2, 3, 4    ; Define a list of 4 elements

section .text
  global _start

_start:
  MOV eax, 0            ; This will store the index of the element we are currently looking at
  MOV cl, 0             ; This will store the sum of the elements in the list, we can use cl because we know the sum will be less than 256

loop:
  MOV bl, [list + eax]  ; Load the element at index eax into bl
  ADD cl, bl            ; Add the element to the sum
  INC eax               ; Move to the next element
  CMP eax, 4            ; Compare the index to the length of the list
  JE end                ; If we have reached the end of the list, jump to the end
  JMP loop              ; Otherwise, continue looping

  ; If we don't know the length of the list, we can use a null terminator to 
  ; determine when we have reached the end. Or some other character that we know
  ; indicates the end of the list. For this case we know the length so we can test
  ; using the CMP instruction.

end:
  MOV eax, 1            ; Prepare the exit syscall (1 is the syscall number for exit)
  MOV ebx, 1            ; Prepare the exit syscall (1 is the exit code)
  INT 0x80              ; Exit the program
