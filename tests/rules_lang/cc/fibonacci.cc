//! Fibonacci library

#include "fibonacci.h"

namespace fibonacci {

std::uint64_t fibonacci(std::uint64_t n) {
  if (n < 2) {
    return n;
  }

  std::uint64_t n1 = 0;
  std::uint64_t n2 = 1;
  for (std::uint64_t i = 1; i < n; ++i) {
    std::uint64_t sum = n1 + n2;
    n1 = n2;
    n2 = sum;
  }

  return n2;
}

}  // namespace fibonacci
