#include "../include/Verifier.h"

int main() {
  int n, k, j;
  n = input();
  k = input();
  assume(k >= 2);
  j = 0;
  while (j < n) {
    j++;
    k--;
  }
  assert(k >= 3);
  return 0;
}
