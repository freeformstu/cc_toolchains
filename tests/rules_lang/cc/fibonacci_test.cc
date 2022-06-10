//! Fibonacci integration test

#include "fibonacci.h"

#include <cassert>
#include <vector>

int main(int argc, char** argv) {
  std::vector<std::uint64_t> numbers = {0,  1,  1,  2,  3,  5,  8,
                                        13, 21, 34, 55, 89, 144};
  for (std::size_t i = 0; i < numbers.size(); ++i) {
    assert(numbers[i] == fibonacci::fibonacci(i));
  }

  return 0;
}
