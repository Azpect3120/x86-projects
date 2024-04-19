#include <stdio.h>

// Export the function to be used in the ASM code
extern int test(int, int);

int test(int a, int b) {
  printf("HERE!\n");
  return a + b;
}
