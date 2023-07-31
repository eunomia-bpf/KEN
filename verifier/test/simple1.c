#include "../include/Verifier.h"

int main() {
  int n, k, j;
  n = input();
  assume(n > 0);
  k = input();
  assume(k > n);
  j = 0;
  while (j < n) {
    j++;
    k--;
  }
  assert(k >= 0);
  return 0;
}
