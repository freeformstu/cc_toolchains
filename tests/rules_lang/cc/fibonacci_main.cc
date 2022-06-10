//! Fibonacci binary for printing the nth fibonacci number

#include <iostream>
#include <string>

#include "fibonacci.h"

bool is_number(const std::string& s) {
  std::string::const_iterator it = s.begin();
  while (it != s.end() && std::isdigit(*it)) ++it;
  return !s.empty() && it == s.end();
}

int main(int argc, char** argv) {
  if (argc != 2) {
    std::cerr << "Please provide a single integral input." << std::endl;
    return -1;
  }

  std::string argv1 = argv[1];

  if (!is_number(argv1)) {
    std::cerr << "The provided input is not an integer value." << std::endl;
    return -1;
  }

  std::uint64_t nth = std::stoull(argv1);

  std::cout << fibonacci::fibonacci(nth) << std::endl;
}
