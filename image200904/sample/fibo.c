/*BINFMTC:
  fibonacci with simple recursion algorithm.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int fibonacci(int i)
{
  switch (i) {case 0:case 1:return i;
  default:return fibonacci(i - 1) + fibonacci(i - 2);
  }
}

int main(int argc, char **argv)
{
  printf("%i\n", fibonacci(atoi(argv[1])));
  return 0;
}
