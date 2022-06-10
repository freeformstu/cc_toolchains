"""Platform defnitions"""

HOST_TOOL_TRIPLES = [
    "aarch64-apple-darwin",
    "aarch64-unknown-linux-gnu",
    "x86_64-apple-darwin",
    "x86_64-pc-windows-gnu",
    "x86_64-pc-windows-msvc",
    "x86_64-unknown-linux-gnu",
]

TARGET_TRIPLES = [
    "aarch64-apple-ios-sim",
    "aarch64-apple-ios",
    "aarch64-linux-android",
    "arm-unknown-linux-gnueabi",
    "armv7-linux-androideabi",
    "armv7-unknown-linux-gnueabi",
    "i686-apple-darwin",
    "i686-linux-android",
    "i686-pc-windows-gnu",
    "i686-pc-windows-msvc",
    "i686-unknown-freebsd",
    "i686-unknown-linux-gnu",
    "powerpc-unknown-linux-gnu",
    "riscv32imc-unknown-none-elf",
    "s390x-unknown-linux-gnu",
    "x86_64-apple-ios",
    "x86_64-linux-android",
    "x86_64-unknown-freebsd",
    "x86_64-unknown-linux-musl",
]

SUPPORTED_TRIPLES = HOST_TOOL_TRIPLES + TARGET_TRIPLES
