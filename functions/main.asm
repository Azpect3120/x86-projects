section .data

section .text
global _start

addTwo:
  ; At this point, the stack looks like this: [RET, arg2, arg1] with the top of the stack being the first element
  ; The elements in the stack can be accessed using the [ebp + offset] notation, with each element being 4 bytes long
  PUSH ebp              ; [ebp, RET, arg2, arg1]
  MOV ebp, esp          ; set the base pointer equal to the stack pointer
  MOV eax, [ebp + 8]    ; eax = arg2
  MOV ebx, [ebp + 12]   ; ebx = arg1
  ADD eax, ebx          ; eax = arg2 + arg1

  ; When we return, it will return to the address that is at the top of the stack,
  ; which at this point is the base pointer
  POP ebp               ; remove the base pointer from the stack: [RET, arg2, arg1]
  RET

_start:
  ; Using the stack to pass arguments to the function
  PUSH 4        ; Pushing the first argument to stack
  PUSH 1        ; Pushing the second argument to stack
  CALL addTwo   ; Calling the function, which will push the RET address to the stack as well

  MOV ebx, eax
  MOV eax, 1
  INT 0x80
