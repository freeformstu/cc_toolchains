//! Fibonacci binary for printing the nth fibonacci number

use std::env;
use std::process;

use fibonacci;

fn main() {
    if env::args().len() != 1 {
        eprintln!("Please provide a single integral input.");
        process::exit(1);
    }

    let argv1 = env::args().last().unwrap();

    let nth = match argv1.parse::<u64>() {
        Ok(val) => val,
        Err(e) => {
            eprintln!("{}", e);
            process::exit(1);
        }
    };

    println!("{}", fibonacci::fibonacci(nth));
}
