//! Fibonacci integration test

use fibonacci::fibonacci;

#[test]
fn test_fibonacci() {
    let numbers: Vec<u64> = vec![0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144];
    for (i, number) in numbers.iter().enumerate() {
        assert_eq!(*number, fibonacci(i as u64));
    }
}
