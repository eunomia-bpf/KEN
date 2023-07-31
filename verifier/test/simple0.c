#include "../include/Verifier.h"

int main() {
  int x = input();
  assume(x > 10);
  while (x > 0) {
    x = x - 1;
  }
  assert(x == 0);
  return 0;
}
