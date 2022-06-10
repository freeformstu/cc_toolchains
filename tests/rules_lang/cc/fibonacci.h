//! Fibonacci library
#ifndef __FIBONACCI_H_INCLUDE__
#define __FIBONACCI_H_INCLUDE__

#include <cstdint>

namespace fibonacci {

/**
 * @brief Returns the nth Fibonacci number.
 *
 * @param nth
 *  The nth Fibonacci number to return.
 *
 * @return std::uint64_t
 *  The nth Fibonacci number.
 */
std::uint64_t fibonacci(std::uint64_t n);

}  // namespace fibonacci

#endif
