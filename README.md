# llvm_toolchains
LLVM toolchain definitions for Bazel.

## API constraints

- toolchains cannot cross vendors (llvm, can only target llvm)
- toolchains cannot cross versions (cannot mix v1.2.3 with v2.0.0)


cc_register_toolchains([
    "llvm-14.0.0-x86_64-unknown-linux-gnu",
    "llvm-14.0.0-x86_64-apple-darwin",
    "llvm-14.0.0-x86_64-pc-windows-gnu",
])

Does this register `rhel` and `ubuntu`?

Do target platforms need to be flavor (`rhel`/`ubuntu`) specific?




Toolchains

proxy -> tools
            \- x86_64


## Artifacts

### MacOS
https://formulae.brew.sh/formula/llvm#default
or github artifacts

### Centos
http://mirrors.vcea.wsu.edu/centos/8-stream/AppStream/x86_64/os/Packages/clang-libs-14.0.0-1.module_el8.7.0+1142+5343df54.i686.rpm
http://mirrors.vcea.wsu.edu/centos/8-stream/AppStream/x86_64/os/Packages/clang-libs-14.0.0-1.module_el8.7.0+1142+5343df54.x86_64.rpm
http://mirrors.vcea.wsu.edu/centos/8-stream/AppStream/x86_64/os/Packages/clang-14.0.0-1.module_el8.7.0+1142+5343df54.x86_64.rpm

### Ubuntu
https://apt.llvm.org/
apt.llvm.org/focal/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220805083048+e4ec381f2cf5-1~exp1~20220805083138.10_amd64.deb

### Windows
windows uses github .exe artifacts
