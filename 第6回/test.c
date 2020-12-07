#include "spim.h"

int main() {
  char buf[100];
  int n;

  print_string("Input string: ");
  read_string(buf, 100);
  print_string(buf);

  print_string("Input number: ");
  n = read_int();
  print_int(n);
  print_string("\n");
}