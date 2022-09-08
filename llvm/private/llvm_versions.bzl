# AUTO-GENERATED: DO NOT MODIFY
# This file was updated by running the following command from the root of the repository:
#
#       python3 ./llvm/private/update_llvm_versions.py

"""Artifact locations for LLVM versions"""

LLVM_VERSIONS = {
    "10.0.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "c2072390dc6c8b4cc67737f487ef384148253a6a97b38030e012c4d7214b7295",
                },
            },
        },
        "amd64-pc-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-amd64-pc-solaris2.11.tar.xz": {
                    "sha256": "aaf6865542bd772e30be3abf620340a050ed5e4297f8be347e959e5483d9f159",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "56d58da545743d5f2947234d413632fd2b840e38f2bed7369f6e65531af36a52",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "ad136e0d8ce9ac1a341a54513dfd313a7a64c49afa7a69d51cdc2118f7fdc350",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "310ed47e957c226b0de17130711505366c225edbed65299ac2c3d59f9a59a41a",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-powerpc64le-linux-rhel-7.4.tar.xz": {
                    "sha256": "958b8a774eae0bb25515d7fb2f13f5ead1450f768ffdcff18b29739613b3c457",
                },
            },
        },
        "sparcv9-sun-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-sparcv9-sun-solaris2.11.tar.xz": {
                    "sha256": "725c9205550cabb6d8e0d8b1029176113615809dcc880b347c1577aecdf2af4c",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-apple-darwin.tar.xz": {
                    "sha256": "633a833396bf2276094c126b072d52b59aca6249e7ce8eae14c728016edb5e61",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-11.3": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-sles11.3.tar.xz": {
                    "sha256": "a7a3c2a7aff813bb10932636a6f1612e308256a5e6b5a5655068d5c5b7f80e86",
                },
            },
        },
    },
    "10.0.1": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-aarch64-linux-gnu.tar.xz": {
                    "sha256": "90dc69a4758ca15cd0ffa45d07fbf5bf4309d47d2c7745a9f0735ecffde9c31f",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-10/clang-10_10.0.1~++20201112101950+ef32c611aa2-1~exp1~20201112092551.202_arm64.deb": {
                    "sha256": "4597846cc8cb204962493f2aaffe751912d490556fda6d8a1546b3d4275d5100",
                    "strip_prefix": "usr",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "290897c328f75df041d1abda6e25a50c2e6a0a3d939b5069661bb966bf7ac843",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "adf90157520cd5e0931b9f186bed0f0463feda56370de4eba51766946f57b02b",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "f404976ad92cf846b7915cd43cd251e090a5e7524809ab96f5a65216988b2b26",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-powerpc64le-linux-rhel-7.4.tar.xz": {
                    "sha256": "27359cae558905bf190834db11bbeaea433777a360744e9f79bfe69226a19117",
                },
            },
        },
        "s390x-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-10/clang-10_10.0.1~++20210405103842+ef32c611aa21-1~exp1~20210405084441.211_s390x.deb": {
                    "sha256": "ad1bb01b036d747b0f6484124448e5e094d757c5cc226bc9b32f608f32476371",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-10/clang-10_10.0.1~++20211003085942+ef32c611aa21-1~exp1~20211003090334.2_s390x.deb": {
                    "sha256": "d729087269b61bad76abe9c2f42939c034ffc5fb41803fe6a93428d6a6a55895",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_32-unknown-linux-gnu": {
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-10/clang-10_10.0.1~++20200708124938+ef32c611aa2-1~exp1~20200707225535.189_i386.deb": {
                    "sha256": "d43019d2ec31fcbe559e82befa9ec012f84dae12121148e76e9d00585d4a9fe7",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-x86_64-apple-darwin.tar.xz": {
                    "sha256": "1154a24597ab77801980dfd5ae4a13c117d6b482bab015baa410aeba443ffd92",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-12.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.1/clang+llvm-10.0.1-x86_64-linux-sles12.4.tar.xz": {
                    "sha256": "59f35fc7967b740315edf31a54b228ae5da8a54f499e37d424d67b7107217ae4",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-10/clang-10_10.0.1~++20211003084855+ef32c611aa21-1~exp1~20211003085243.2_amd64.deb": {
                    "sha256": "9ddaf2d0edff693a60c1d1919da5ce4bd1b3c5262657bec70497515acfd6abed",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-10/clang-10_10.0.1~++20211003085942+ef32c611aa21-1~exp1~20211003090334.2_amd64.deb": {
                    "sha256": "d6da7570c2353345bb9dc133e779cd00d2c484418d63714303b88db7c0f78568",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-10/clang-10_10.0.1~++20210327122936+ef32c611aa21-1~exp1~20210327113535.195_amd64.deb": {
                    "sha256": "87ab5f7bc16dd5539d005b234d1e812dd36a565023d1c7d135df21ff1669cfa3",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "11.0.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "9ddc8d3fb445f2223db1bb5c54c0203257099240ba377df72e27db9ae31c0f86",
                },
            },
        },
        "amd64-pc-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-amd64-pc-solaris2.11.tar.xz": {
                    "sha256": "031699337d703fe42843a8326f94079fd67e46b60f25be5bdf47664e158e0b43",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "3a3bcac4da7d1ed431fef469fe52ccf9a525016d6900718a447986c7ab850d45",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "1c72656eff8aefa33da418fd511aa235f14934fa92a0a7d43179525ea8d54ad9",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "649ae62e8b85cd44b872678b118c8cbc75e2e29d94d995fddd9149fc6c3a4040",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-powerpc64le-linux-rhel-7.4.tar.xz": {
                    "sha256": "ea82565066c53f30cc76fc7a46f7737a91ad88c07ac25da1b4f9d0ea7e93ae70",
                },
            },
        },
        "sparcv9-sun-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-sparcv9-sun-solaris2.11.tar.xz": {
                    "sha256": "3f2bbbbd9aac9809bcc561d73b0db39ecd64fa099fac601f929da5e95a63bdc5",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-apple-darwin.tar.xz": {
                    "sha256": "b93886ab0025cbbdbb08b46e5e403a462b0ce034811c929e96ed66c2b07fe63a",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-12.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-sles12.4.tar.xz": {
                    "sha256": "ce3e2e9788e0136f3082eb3199c6e2dd171f4e7c98310f83fc284c5ba734d27a",
                },
            },
        },
    },
    "11.0.1": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-aarch64-linux-gnu.tar.xz": {
                    "sha256": "39b3d3e3b534e327d90c77045058e5fc924b1a81d349eac2be6fb80f4a0e40d4",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "cd0a6da1825bc7440c5a8dfa22add4ee91953c45aa0e5597ba1a5caf347f807d",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "2daa205f87d2b81a281f3883c2102cd69ac017193b19ea30f914b57f904c7c4b",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "5c6b3a1104ac3999c11e18b42c7feca47e0bb894d55b938aba32b1c362402a52",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "e32ad587e800145a7868449b1416e25d05a6ca08c071ecc8173cf9e1b0b7dcdd",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-i386-unknown-freebsd12.tar.xz": {
                    "sha256": "46e88ce3a5efef198cade0cf29ee152f3361ca4488fd7701cc79485c06aa93b8",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-powerpc64le-linux-rhel-7.4.tar.xz": {
                    "sha256": "d270ded2cbcb76588bbf71dad2e3657961896bfadf7ff4da57d07870da537873",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-12.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/clang+llvm-11.0.1-x86_64-linux-sles12.4.tar.xz": {
                    "sha256": "77cd59cf6f932cf2b3c9a68789d1bd3f7ba9f471a28f6ba25e25deb1a0806e0d",
                },
            },
        },
    },
    "11.1.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "18df38247af3fba0e0e2991fb00d7e3cf3560b4d3509233a14af699ef0039e1c",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "645e24018aa2694d8ccb44139f44a0d3af97fa8eab785faecb7a228ebe76ac7e",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "430284b75248ab2dd3ebb8718d8bbb19cc8b9b62f4707ae47a61827b3ba59836",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "18a3c3aedf1181aa18da3f5d0a2c67366c6d5fb398ac00e461298d9584be5c68",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "ddc451c1094d0c8912160912d7c20d28087782758e0a8d145f301a18ddcea558",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-i386-unknown-freebsd12.tar.xz": {
                    "sha256": "3c23d3b97f869382b33878d8a5210056c60d5e749acfeea0354682bb013f5a20",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-powerpc64le-linux-rhel-7.4.tar.xz": {
                    "sha256": "8ff13bb70f1eb8efe61b1899e4d05d6f15c18a14a9ffa883f54f243b060fa778",
                },
            },
        },
        "s390x-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-11/clang-11_11.1.0~++20211011094159+1fdec59bffc1-1~exp1~20211011214614.8_s390x.deb": {
                    "sha256": "4cdefc633c317751c75e29ef31cfa70591d23b112fafb7611782a2e475603dfe",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-11/clang-11_11.1.0~++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5_s390x.deb": {
                    "sha256": "8ef3c0e853d7b3b66e048ebbc785633c78cec4e2559df2c1995b4a14d446083d",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_32-unknown-linux-gnu": {
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-11/clang-11_11~++20200721055954+cebd637c886-1~exp1~20200721161335.13_i386.deb": {
                    "sha256": "c2b53fe90903df393bc2bb9012fe870a762a42ea3dd7d7fa0e729e6d6f3112eb",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-11/clang-11_11.1.0~++20211011094159+1fdec59bffc1-1~exp1~20211011214614.8_amd64.deb": {
                    "sha256": "a7e50624e63534af30b03ace2623fa6fe255a81b36595bb2d0c972f46e43b4b8",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-11/clang-11_11.1.0~++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5_amd64.deb": {
                    "sha256": "52b424e0f970d600f13b273d34a81ca3a499a92a9c94affb4ddcf082db867930",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-11/clang-11_11.1.0~++20210314110124+1fdec59bffc1-1~exp1~20210314220751.162_amd64.deb": {
                    "sha256": "753a1ea50c41e1fdd5ee159a915781c646884fd5ad1eeb67d887b36b539da83e",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "12.0.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "d05f0b04fb248ce1e7a61fcd2087e6be8bc4b06b2cc348792f383abf414dec48",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "8ff2ae0863d4cbe88ace6cbcce64a1a6c9a8f1237f635125a5d580b2639bba61",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "0a90d2cf8a3d71d7d4a6bee3e085405ebc37a854311bce82d6845d93b19fcc87",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "697d432c2572e48fc04118fc7cec63c9477ef2e8a7cca2c0b32e52f9705ab1cc",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "8298a026f74165bf6088c1c942c22bd7532b12cd2b916f7673bdaf522abe41b0",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-i386-unknown-freebsd12.tar.xz": {
                    "sha256": "1e61921735fd11754df193826306f0352c99ca6013e22f40a7fc77f0b20162be",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.9": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-powerpc64le-linux-rhel-7.9.tar.xz": {
                    "sha256": "61b879b94f91770202da435e23fe0f4953ecf1a02475804f91f51db54488e61c",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-apple-darwin.tar.xz": {
                    "sha256": "7bc2259bf75c003f644882460fc8e844ddb23b27236fe43a2787870a4cd8ab50",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-12.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-sles12.4.tar.xz": {
                    "sha256": "00c25261e303080c2e8d55413a73c60913cdb39cfd47587d6817a86fe52565e9",
                },
            },
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-12/clang-12_12.0.0~++20210319082646+4990141a4366-1~exp1~20210319193401.61_amd64.deb": {
                    "sha256": "3812aecd959263c0a657e136ee7ceac6ec6b16520eaaa384a79d53a4c3eba32d",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "12.0.1": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-aarch64-linux-gnu.tar.xz": {
                    "sha256": "3d4ad804b7c85007686548cbc917ab067bf17eaedeab43d9eb83d3a683d8e9d4",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-12/clang-12_12.0.1~++20211102090516+fed41342a82f-1~exp1~20211102211019.11_arm64.deb": {
                    "sha256": "4ce8e57899346f288017eb79c868a0882fbb96a16a390c38baf3d7267c20e199",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-12/clang-12_12.0.1~++20211029101322+fed41342a82f-1~exp1~20211029221816.4_arm64.deb": {
                    "sha256": "da3b40d05009cdb6a031826db6e14a1f73075aa99e7bfe236104b782be568585",
                    "strip_prefix": "usr",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "94dfe48d9e483283edbee968056d487a850b30de25258fa48f049cca3ede5db4",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "38857da36489880b0504ae7142b74abe41cf18711a6bb25ca96792d8190e8b0e",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "1ec685b5026f9cc5e7316a5ff2dffd8ff54ad9941e642df19062cc1359842c86",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "346e14e5a9189838704f096e65579c8e1915f95dcc291aa7f20626ccf9767e04",
                },
            },
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-i386-unknown-freebsd12.tar.xz": {
                    "sha256": "1f3b5e99e82165bf3442120ee3cb2c95ca96129cf45c85a52ec8973f8904529d",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.9": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-powerpc64le-linux-rhel-7.9.tar.xz": {
                    "sha256": "9849fa17fb7eb666744f1e2ce8dcb5d28753c4c482cc6f5e3d2b5ad2108dc2de",
                },
            },
        },
        "s390x-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-12/clang-12_12.0.1~++20211102090516+fed41342a82f-1~exp1~20211102211019.11_s390x.deb": {
                    "sha256": "a3e6f8852525ed0ce124328a07207501215176f1d58c1c4392b301e85f434064",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-12/clang-12_12.0.1~++20211029101322+fed41342a82f-1~exp1~20211029221816.4_s390x.deb": {
                    "sha256": "52496c0a2a34d358a8d97f25330322c45c22ab1c9ff104171310c46509091bc0",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-12/clang-12_12.0.1~++20211102090516+fed41342a82f-1~exp1~20211102211019.11_amd64.deb": {
                    "sha256": "ec62fb950501b50b55df217a32dcd552ec715bcb7c5778f70d8842cbd64d840b",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-12/clang-12_12.0.1~++20211029101322+fed41342a82f-1~exp1~20211029221816.4_amd64.deb": {
                    "sha256": "bf14184d2010d6e7f5d233c4fd82c961cdc1dcaa577ced59f1963ee9d5ed1f21",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "13.0.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "968d65d2593850ee9b37fcda074fb7641529bd45d2f976af6c8197de3c22612f",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "e579747a36ff78aa0a5533fe43bc1ed1f8ed449c9bfec43c358d953ffbbdcf76",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "c4f15e156afaa530eb47ba13c46800275102af535ed48e395aed4c1decc1eaa1",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "e17aacd843cc7c3c3c27a0d2293af8b3e9ad76408f7c178a92a182f18e7734e5",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-i386-unknown-freebsd12.tar.xz": {
                    "sha256": "4d14b19c082438a5ceed61e538e5a0298018b1773e8ba2e990f3fbe33492f48f",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-i386-unknown-freebsd13.tar.xz": {
                    "sha256": "f8e105c6ac2fd517ae5ed8ef9b9bab4b015fe89a06c90c3dd5d5c7933dca2276",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.9": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-powerpc64le-linux-rhel-7.9.tar.xz": {
                    "sha256": "cfade83f6da572a8ab0e4796d1f657967b342e98202c26e76c857879fb2fa2d2",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-x86_64-apple-darwin.tar.xz": {
                    "sha256": "d051234eca1db1f5e4bc08c64937c879c7098900f7a0370f3ceb7544816a8b09",
                },
            },
        },
    },
    "13.0.1": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-aarch64-linux-gnu.tar.xz": {
                    "sha256": "15ff2db12683e69e552b6668f7ca49edaa01ce32cb1cbc8f8ed2e887ab291069",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220120110844+75e33f71c2da-1~exp1~20220120230854.66_arm64.deb": {
                    "sha256": "e82241132a493aefe6a15f1dc25ad07ce5e2eccc37aeade3a93ed528dfa9c844",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220120110924+75e33f71c2da-1~exp1~20220120231001.58_arm64.deb": {
                    "sha256": "e374f5cfb110a051322daeaa1e1b5add6397b21caba55c9af5d45ab6dcccd020",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220217091255+75e33f71c2da-1~exp1~20220217091338.8_arm64.deb": {
                    "sha256": "26fa747a2a5cb562992615dbb39c58b60479526a22a14a2b90a61f11d4dbaf12",
                    "strip_prefix": "usr",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "8101c8d3a920bf930b33987ada5373f43537c5de8c194be0ea10530fd0ad5617",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "f1ba8ec77b5e82399af738ad9897a8aafc11c5692ceb331c8373eae77018d428",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "1215720114538f57acbe2f3b0614c23f4fc551ba2976afa3779a3c01aaaf1221",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-i386-unknown-freebsd12.tar.xz": {
                    "sha256": "e3c921e0f130afa6a6ebac23c31b66b32563a5ec53a2f4ed4676f31a81379f70",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-i386-unknown-freebsd13.tar.xz": {
                    "sha256": "e85c46bd64a0217f3df1f42421a502648d6741ef29fd5d44674b87af119ce25d",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.9": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-powerpc64le-linux-rhel-7.9.tar.xz": {
                    "sha256": "ab659c290536182a99c064d4537d2fb1273bb2b1bf8c6a43866f033bf1ece4a8",
                },
            },
        },
        "s390x-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220120110844+75e33f71c2da-1~exp1~20220120230854.66_s390x.deb": {
                    "sha256": "f9c0986e698ca48059110d220844a0fa12cc0b4e6d3fcb3e546d446d0a2fc7ff",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220120110924+75e33f71c2da-1~exp1~20220120231001.58_s390x.deb": {
                    "sha256": "bb5e59bcc222524a7ec153bcd175a8aadeec8173e7de55162d7512718ba5a65f",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220216083459+75e33f71c2da-1~exp1~20220216203538.6_s390x.deb": {
                    "sha256": "88ee7de929cc2c002f878f0737619f1b033c00ea1405ddc17a7866546da338fe",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.1/clang+llvm-13.0.1-x86_64-apple-darwin.tar.xz": {
                    "sha256": "dec02d17698514d0fc7ace8869c38937851c542b02adf102c4e898f027145a4d",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220120110844+75e33f71c2da-1~exp1~20220120230854.66_amd64.deb": {
                    "sha256": "a4dd81679bbd5e7e892c7dc1c3e5c725d354e924a17b62c776b353f0aedb745f",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220120110924+75e33f71c2da-1~exp1~20220120231001.58_amd64.deb": {
                    "sha256": "2dc77b423ae0e815bac2cb855ef79547e1cc617f39b9762afdc37e03fbf54b82",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-13/clang-13_13.0.1~++20220217091255+75e33f71c2da-1~exp1~20220217091338.8_amd64.deb": {
                    "sha256": "8bf3de2bf01ad92d41002e4ae69527af7a01d0259c6cf86b92eb59a07a3666cb",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "14.0.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "1792badcd44066c79148ffeb1746058422cc9d838462be07e3cb19a4b724a1ee",
                },
            },
        },
        "amd64-pc-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-amd64-pc-solaris2.11.tar.xz": {
                    "sha256": "a708470fdbaadf530d6cfd56f92fde1328cb47ef8439ecf1a2126523e7c94a50",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "7eaff7ee2a32babd795599f41f4a5ffe7f161721ebf5630f48418e626650105e",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "b68d73fd57be385e7f06046a87381f7520c8861f492c294e6301d2843d9a1f57",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "17d5f60c3d5f9494be7f67b2dc9e6017cd5e8457e53465968a54ec7069923bfe",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-i386-unknown-freebsd12.tar.xz": {
                    "sha256": "5ed9d93a8425132e8117d7061d09c2989ce6b2326f25c46633e2b2dee955bb00",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-i386-unknown-freebsd13.tar.xz": {
                    "sha256": "81f49eb466ce9149335ac8918a5f02fa724d562a94464ed13745db0165b4a220",
                },
            },
        },
        "powerpc64-ibm-aix": {
            "aix-7.2": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-powerpc64-ibm-aix-7.2.tar.xz": {
                    "sha256": "4ad5866de6c69d989cbbc989201b46dfdcd7d2b23a712fcad7baa09c204f10de",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.9": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-powerpc64le-linux-rhel-7.9.tar.xz": {
                    "sha256": "7a31de37959fdf3be897b01f284a91c28cd38a2e2fa038ff58121d1b6f6eb087",
                },
            },
        },
        "sparcv9-sun-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-sparcv9-sun-solaris2.11.tar.xz": {
                    "sha256": "b342cdaaea3b44de5b0f45052e2df49bcdf69dcc8ad0c23ec5afc04668929681",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-apple-darwin.tar.xz": {
                    "sha256": "cf5af0f32d78dcf4413ef6966abbfd5b1445fe80bba57f2ff8a08f77e672b9b3",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-12.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-linux-sles12.4.tar.xz": {
                    "sha256": "78f70cc94c3b6f562455b15cebb63e75571d50c3d488d53d9aa4cd9dded30627",
                },
            },
        },
    },
    "14.0.1": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-aarch64-linux-gnu.tar.xz": {
                    "sha256": "0f1fe0c927ebc2fc9e7d55188b80cd4982e49ae2a667bff1199435fb21159f52",
                },
            },
        },
        "amd64-pc-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-amd64-pc-solaris2.11.tar.xz": {
                    "sha256": "220c3f690a6e7ca2fb180594071d39556a4ea0951672397c9f5946656f088956",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "755023705bb7caa9db3f06c02908f840612a1497da4da617d1022522a978f4de",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "657497b3525b9ae115a019bb5ea401f198e087761f17155f4335a5df1f6994df",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "be17b515b4a7938959ada101ca72fd9f59faf605e5838211e8915a36bf68f0d5",
                },
            },
        },
        "powerpc64-ibm-aix": {
            "aix-7.2": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-powerpc64-ibm-aix-7.2.tar.xz": {
                    "sha256": "0426b0b87c6275436f8285f4998f5588139405d61a3d5edc64c88119b57f4ebf",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-8.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-powerpc64le-linux-rhel-8.4.tar.xz": {
                    "sha256": "222238faa88a46b65a0610923bb27ab357e7eb1ac3f894c89c0b474b516da4bf",
                },
            },
        },
        "sparcv9-sun-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-sparcv9-sun-solaris2.11.tar.xz": {
                    "sha256": "ba2e06fda8e0c5eb7daec3159b43ac1b41a9ef6a576cab772b0bc5bfc3ba5851",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.1/clang+llvm-14.0.1-x86_64-apple-darwin.tar.xz": {
                    "sha256": "43149390e95b1cdbf1d4ef2e9d214bbb6d35858ceb2df27245868e06bc4fc44c",
                },
            },
        },
    },
    "14.0.2": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.2/clang+llvm-14.0.2-aarch64-linux-gnu.tar.xz": {
                    "sha256": "ad6d065a2cf1c67698cc7f368722b1adc3fa2d7c9401446f0046612b6c90edc4",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.2/clang+llvm-14.0.2-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "1df946b25963e941253e2aad31c92979630af9b12fc8be2538e191013a151bb1",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.2/clang+llvm-14.0.2-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "0acab62c60dfb7449cd635000300feeff19717a14056d33a90c0b33fd0ffcb01",
                },
            },
        },
        "powerpc64-ibm-aix": {
            "aix-7.2": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.2/clang+llvm-14.0.2-powerpc64-ibm-aix-7.2.tar.xz": {
                    "sha256": "837482b5ca8f144365bd1810910cbce39d0d3c4c97a8aa4ac8612d0ffb248407",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.2/clang+llvm-14.0.2-x86_64-apple-darwin.tar.xz": {
                    "sha256": "7037efca192eb04a569a7422bd5d974a0af315b979252b6d956d2657ac33d672",
                },
            },
        },
    },
    "14.0.3": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.3/clang+llvm-14.0.3-aarch64-linux-gnu.tar.xz": {
                    "sha256": "36958cf3f1be9e91f33b0ce86afe049c2cf89c320996f963ee232c2405a811ec",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.3/clang+llvm-14.0.3-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "62737fb1da58af725c0c93015c5d8250a723d976e8d7ef26b6445f8cb23c4f91",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.3/clang+llvm-14.0.3-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "2c8d9537af54626395a3dbd0aa7ccd2c76aab567507a8293ab75967ab784162d",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.3/clang+llvm-14.0.3-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "2279cd46a7b619a0cb66d54012917c889e37c56f718ab92813dc13131f2fd805",
                },
            },
        },
        "powerpc64-ibm-aix": {
            "aix-7.2": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.3/clang+llvm-14.0.3-powerpc64-ibm-aix-7.2.tar.xz": {
                    "sha256": "2afa547a182248a36815f31a427faced639286881bc975804563994e6c962552",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-8.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.3/clang+llvm-14.0.3-powerpc64le-linux-rhel-8.4.tar.xz": {
                    "sha256": "6c2d79cebec1a0ba96c13bca613b01b7ebf194fcbd0ecf4d3432d4a7804e71ff",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.3/clang+llvm-14.0.3-x86_64-apple-darwin.tar.xz": {
                    "sha256": "90e07966dbaf87de0cbb206ab763023f9c559612c91d43a1711af7dc026cfb81",
                },
            },
        },
    },
    "14.0.4": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.4/clang+llvm-14.0.4-aarch64-linux-gnu.tar.xz": {
                    "sha256": "0c960d50c83360d81e698120f131cf004676cbe5ac6db6fbe67a0950f3cde2d1",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.4/clang+llvm-14.0.4-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "80814b7a7a56151b204aa8cb621df22c645f41c834920c3818d6b6eadb175a79",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.4/clang+llvm-14.0.4-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "282696627bb3f2d07dd38d7c67ecff97877f2b984d712dbcb506e3f0a63ad1f8",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.4/clang+llvm-14.0.4-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "09bb79557235aee16badc4e3db86a121b0b3c7af226e093c908a1c66c5a0c4c4",
                },
            },
        },
        "powerpc64-ibm-aix": {
            "aix-7.2": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.4/clang+llvm-14.0.4-powerpc64-ibm-aix-7.2.tar.xz": {
                    "sha256": "2af35c3e1b60f68551cd92a31b66c6ad9b2986e9cb3f2aa924e225ae254d1a46",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-8.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.4/clang+llvm-14.0.4-powerpc64le-linux-rhel-8.4.tar.xz": {
                    "sha256": "0c35b2ebd22c081d19679889e4afedf2060f1649d1060d45e0fa00f61dfba542",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.4/clang+llvm-14.0.4-x86_64-apple-darwin.tar.xz": {
                    "sha256": "f6d9801b0bd78479229d21e2d5650c5a61f9ab1b6f80bad0dccf4b7a7eb30abf",
                },
            },
        },
    },
    "14.0.5": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.5/clang+llvm-14.0.5-aarch64-linux-gnu.tar.xz": {
                    "sha256": "e8138f24d716ef9714e259ab276e6ef74c8adcf9af0270464a8a01c24a583ea8",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.5/clang+llvm-14.0.5-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "1edee096aa23e2c0b75352953c4f04a105fd9521de6742d4652b44ab9009636c",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.5/clang+llvm-14.0.5-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "52c62e29f2cd8d72d592cded337e47bb8cb0998f7ee5f3c1b168790bdce154e7",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.5/clang+llvm-14.0.5-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "f80dbd2684f8fe13ce675236e5ef0235fdf5239d442c21f066245d7fb98ba11c",
                },
            },
        },
        "powerpc64-ibm-aix": {
            "aix-7.2": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.5/clang+llvm-14.0.5-powerpc64-ibm-aix-7.2.tar.xz": {
                    "sha256": "8b2dd8fb508d295cf72be84a592a3592824fd4d881a9fcd6c2a64ba4954fe944",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-8.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.5/clang+llvm-14.0.5-powerpc64le-linux-rhel-8.4.tar.xz": {
                    "sha256": "003314da4c23996f4fb40590e152ec2f42cd2c9ad71d70be68fcc76a746cb093",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.5/clang+llvm-14.0.5-x86_64-apple-darwin.tar.xz": {
                    "sha256": "66cf1b8e00289a567b2f5f740f068b7682e27ccf048647b836d3624376a64705",
                },
            },
        },
    },
    "14.0.6": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-aarch64-linux-gnu.tar.xz": {
                    "sha256": "1a81fda984f5e607584916fdf69cf41e5385b219b983544d2c1a14950d5a65cf",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220622053019+f28c006a5895-1~exp1~20220622173056.159_arm64.deb": {
                    "sha256": "421a2fa539bc6b77a0dfb701833d06bee8fe542e5faba6c3c45a21aee29dded2",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220827082222+f28c006a5895-1~exp1~20220827202233.158_arm64.deb": {
                    "sha256": "dbe00caf5e408fde4ca13d212372f348277c00c0d9635734ccc17cdf0a75d2c3",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220816122211+f28c006a5895-1~exp1~20220816122246.108_arm64.deb": {
                    "sha256": "72afa46fffac6254d4c271e69f56819a0c118d3e715363b493e6701adce41420",
                    "strip_prefix": "usr",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-12": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-amd64-unknown-freebsd12.tar.xz": {
                    "sha256": "b0a7b86dacb12afb8dd2ca99ea1b894d9cce84aab7711cb1964b3005dfb09af3",
                },
            },
            "freebsd-13": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-amd64-unknown-freebsd13.tar.xz": {
                    "sha256": "503e806ae67323c4f790ea2b1fe21e52809814d6a51263e2618f0c22ec47f6ff",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "e50243c191334b80faa0bb18bbadb8afa35cd3d19cb521353c666c1a7ef20173",
                },
            },
        },
        "powerpc64-ibm-aix": {
            "aix-7.2": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-powerpc64-ibm-aix-7.2.tar.xz": {
                    "sha256": "38af6625848a8343dc834c2a272ba88028efab575681d913a39a3c6eaa3c11dc",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-8.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-powerpc64le-linux-rhel-8.4.tar.xz": {
                    "sha256": "4ef7c608ac026bca64149e59fb3abfe0f5212f2be0af12fe6e52c9413b1f7c4a",
                },
            },
        },
        "s390x-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220622053019+f28c006a5895-1~exp1~20220622173056.159_s390x.deb": {
                    "sha256": "65223c80fcee25c50801bedcf07ce27a41e9b041f722c624a28361905b4b179e",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220827082222+f28c006a5895-1~exp1~20220827202233.158_s390x.deb": {
                    "sha256": "9f00c30c1854e1fc85572a5280e8760bd134d25d0b7f31d4c8aaaf2e6e1e6889",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220816122211+f28c006a5895-1~exp1~20220816122246.108_s390x.deb": {
                    "sha256": "d210d62d993bfa49197820d81ef2b074ebbdead697171f031fb1ba7485579e40",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-x86_64-apple-darwin.tar.xz": {
                    "sha256": "e6cc6b8279661fd4452c2847cb8e55ce1e54e1faf4ab497b37c85ffdb6685e7c",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220622053019+f28c006a5895-1~exp1~20220622173056.159_amd64.deb": {
                    "sha256": "24e2272c842567e54fce2829d7cd0d572f4d214afb76217b257a8a97211158f9",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220827082222+f28c006a5895-1~exp1~20220827202233.158_amd64.deb": {
                    "sha256": "c1634c18d10eec1eb8b344675828fbc359794a43a9c43af6994238c7d8fc2f40",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-14/clang-14_14.0.6~++20220816122211+f28c006a5895-1~exp1~20220816122246.108_amd64.deb": {
                    "sha256": "454efe978b2508c217f1f97a3f669fe3f544d3bab5f06673f3a600624b9a04c9",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "15.0.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "527ed550784681f95ec7a1be8fbf5a24bd03d7da9bf31afb6523996f45670be3",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073740+1c73596d3454-1~exp1~20220908073841.49_arm64.deb": {
                    "sha256": "66641b6aeda827c0a9722c85f9cd5a48c6feb4d3705fe52dfccf85526c39f13d",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073322+1c73596d3454-1~exp1~20220908073334.51_arm64.deb": {
                    "sha256": "186ce552bc10faa2d5622500b7eea9b1f7d7065230c1b17f40053cb79e759456",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073342+1c73596d3454-1~exp1~20220908073448.54_arm64.deb": {
                    "sha256": "2b3d9cafa8d0cf12637bf09e1789bb28bbdfe3f1db4666fc7e304a292458882c",
                    "strip_prefix": "usr",
                },
            },
        },
        "amd64-pc-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-amd64-pc-solaris2.11.tar.xz": {
                    "sha256": "5b9fd6a30ce6941adf74667d2076a49aa047fa040e3690f7af26c264d4ce58e7",
                },
            },
        },
        "arm64-apple-darwin": {
            "darwin-21.0": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-arm64-apple-darwin21.0.tar.xz": {
                    "sha256": "cfd5c3fa07d7fccea0687f5b4498329a6172b7a15bbc45b547d0ac86bd3452a5",
                },
            },
        },
        "s390x-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073740+1c73596d3454-1~exp1~20220908073841.49_s390x.deb": {
                    "sha256": "11fb699551fec57dbc42507c837455c48ccd2e954e8a5ee86bf4ded77b02bfa4",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073322+1c73596d3454-1~exp1~20220908073334.51_s390x.deb": {
                    "sha256": "7435ca5fbd243e27700fbf5dcf6a24149320f4ab94383b317aaf0aa52c26831b",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073342+1c73596d3454-1~exp1~20220908073448.54_s390x.deb": {
                    "sha256": "2f9eeaf324d950419e1e519bc9e9c43f78e72cef30b6350a33d0d5b8b6201dad",
                    "strip_prefix": "usr",
                },
            },
        },
        "sparcv9-sun-solaris": {
            "solaris-2.11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-sparcv9-sun-solaris2.11.tar.xz": {
                    "sha256": "4354854976355ca6f4ac90231a97121844c4fc9f998c9850527390120c62f01f",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/clang+llvm-15.0.0-x86_64-apple-darwin.tar.xz": {
                    "sha256": "8fb11e6ada98b901398b2e7b0378a3a59e88c88c754e95d8f6b54613254d7d65",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073740+1c73596d3454-1~exp1~20220908073841.49_amd64.deb": {
                    "sha256": "406ee04e29c993d27015c3195329d5cb0f9cbd6f57ef813e53f626577e849902",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073322+1c73596d3454-1~exp1~20220908073334.51_amd64.deb": {
                    "sha256": "b90031b1494dd4deb3056f494042d38b2e985a18808658e5b5f39a892458d1ef",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-jammy": {
                "https://apt.llvm.org/jammy/pool/main/l/llvm-toolchain-15/clang-15_15.0.0~++20220908073342+1c73596d3454-1~exp1~20220908073448.54_amd64.deb": {
                    "sha256": "fbc93bd6ca911b6d994353cb8a864061e74929eadcde97dce02f226df15801c9",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "3.9.1": {},
    "4.0.0": {},
    "5.0.2": {},
    "6.0.0": {},
    "6.0.1": {},
    "7.0.0": {
        "x86_32-unknown-linux-gnu": {
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-7/clang-7_7.1.0~svn353565-1~exp1~20190408084827.60_i386.deb": {
                    "sha256": "02559e189acb4fd6058a3ec403df902f54a6249d7719c84bd687f7676ab00fb1",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-7/clang-7_7.1.0~svn353565-1~exp1~20190408084827.60_amd64.deb": {
                    "sha256": "f0eb0640955578d61a1a8d2d2e7e427ed4bea264c42b223865248f59edf753ef",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "7.1.0": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/clang+llvm-7.1.0-aarch64-linux-gnu.tar.xz": {
                    "sha256": "b7369d91279cfc470f82528c23318b902adea8e345b7d64a59332c7f6900acfe",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/clang+llvm-7.1.0-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "183c7949fcd0db5638ed471c138a594b7176d53ff2a6558754e703f4075acb80",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/clang+llvm-7.1.0-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "bac0c55c1943ee4e4eece850e18cc9cbd638e5c84f397b8897c0a8486f73431b",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/clang+llvm-7.1.0-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "d43471d32bc2cadd77a6a61e15316a9870a4b2825b3a73b9b362cc063e4a8ae1",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-11.3": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/clang+llvm-7.1.0-x86_64-linux-sles11.3.tar.xz": {
                    "sha256": "968b5a4d607c225f8496b72e20af69ed9d5b5b5ef384a8e9dd6c873af6c641c2",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-7/clang-7_7.1.0~svn353565-1~exp1~20190406090509.61_amd64.deb": {
                    "sha256": "9084349a0ddc9481191f38d36c2cf101455ad3ea800a48ef5797769833570a05",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "8.0.0": {
        "x86_32-unknown-linux-gnu": {
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-8/clang-8_8.0.1+svn369350-1~exp1~20200112113617.82_i386.deb": {
                    "sha256": "b6fc7c238650fb4759f636073453bb161f3884a5c42516c27e906270d907c2f2",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-8/clang-8_8.0.1+svn369350-1~exp1~20200112113617.82_amd64.deb": {
                    "sha256": "94fd33c9aff23094c01d661bf5a0e269e753f9f57f192aaf6971d67950f69e70",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "8.0.1": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/clang+llvm-8.0.1-aarch64-linux-gnu.tar.xz": {
                    "sha256": "0672ccf5b2f16e31994e41094aad890851d45fb69b58c4429aa0a7fde50e9510",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/clang+llvm-8.0.1-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "4ae625169fa0ae56cf534cddc6f8eda76123f89adac0de439d0e47885fccc813",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/clang+llvm-8.0.1-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "c87b57496f8ec0f0fd74faa1c43b0ac12c156aae54d9be45169fd8f2b33b2181",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/clang+llvm-8.0.1-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "f0ab06cce95f9339af3e27e728913414a7b775a5bdb6c90e2a4f67f8cf2a917e",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/clang+llvm-8.0.1-powerpc64le-linux-rhel-7.4.tar.xz": {
                    "sha256": "c26676326892119b015286efcd6f485b11c1055717454f6884c4ac5896ad5771",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "sles-11.3": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/clang+llvm-8.0.1-x86_64-linux-sles11.3.tar.xz": {
                    "sha256": "ec5d7fd082137ce5b72c7b4dde9a83c07a7e298773351ab6a0693a8200d0fa0c",
                },
            },
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-8/clang-8_8.0.1+svn369350-1~exp1~20200114191400.80_amd64.deb": {
                    "sha256": "60977eb80d09eecf8c4c93442ee5b6aaae606d74eac1abf899f4ca3388b3c8bc",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "9.0.0": {
        "s390x-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-9/clang-9_9~+20211003084840+c1a0a213378a-1~exp1~20211003085209.3_s390x.deb": {
                    "sha256": "9e769044e6e93661096da6c7b922260375ef061a7f6321fffc532af56512d3ad",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-9/clang-9_9~+20211003090642+c1a0a213378a-1~exp1~20211003091017.2_s390x.deb": {
                    "sha256": "2a2a811e7c0f36497cee1b2029c6547e8f3e339211f6870ccdfb23b20ed1f672",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_32-unknown-linux-gnu": {
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-9/clang-9_9~+20191211110317+c1a0a213378-1~exp1~20191211221711.104_i386.deb": {
                    "sha256": "de0c69996b1bcf5442a2a83ead3b91000e56a658cee75f44fd26f33ccc0f4735",
                    "strip_prefix": "usr",
                },
            },
        },
        "x86_64-unknown-linux-gnu": {
            "ubuntu-bionic": {
                "https://apt.llvm.org/bionic/pool/main/l/llvm-toolchain-9/clang-9_9~+20211003084840+c1a0a213378a-1~exp1~20211003085209.3_amd64.deb": {
                    "sha256": "d64eb9a7de015cd7f409d02b4a867ad3368d79a1ee43e9b13cda0281309c79bb",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-focal": {
                "https://apt.llvm.org/focal/pool/main/l/llvm-toolchain-9/clang-9_9~+20211003090642+c1a0a213378a-1~exp1~20211003091017.2_amd64.deb": {
                    "sha256": "9af0473fc93d76eb371e2d7d9e5543ac5dd4a7057efb5a20a072fc8aa6d2887e",
                    "strip_prefix": "usr",
                },
            },
            "ubuntu-xenial": {
                "https://apt.llvm.org/xenial/pool/main/l/llvm-toolchain-9/clang-9_9~+20210314105943+c1a0a213378a-1~exp1~20210314220516.107_amd64.deb": {
                    "sha256": "e1eced6ef7bd94b18bf5cb53d760f000a18740902d79190e80f63a67bd5bee2c",
                    "strip_prefix": "usr",
                },
            },
        },
    },
    "9.0.1": {
        "aarch64-unknown-linux-gnu": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang+llvm-9.0.1-aarch64-linux-gnu.tar.xz": {
                    "sha256": "84023d5309646e1f56beed056ab7d7ecf92d03b26e87917deb8e7fc191805d15",
                },
            },
        },
        "amd64-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang+llvm-9.0.1-amd64-unknown-freebsd11.tar.xz": {
                    "sha256": "4e23de41f67c26f67077e24cf8009e42c59c52c41e930faebfc112a63f7dfd57",
                },
            },
        },
        "armv7a-unknown-linux-gnueabihf": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang+llvm-9.0.1-armv7a-linux-gnueabihf.tar.xz": {
                    "sha256": "91638613913537f8c0c84a59f59f00fafeafb6b189164cae471d4e3bccaf1df3",
                },
            },
        },
        "i386-unknown-freebsd": {
            "freebsd-11": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang+llvm-9.0.1-i386-unknown-freebsd11.tar.xz": {
                    "sha256": "2947ffb55545230b7fc9a25275ffc6e6653b749a3b6c9f105073541593b0fcba",
                },
            },
        },
        "powerpc64le-unknown-linux-gnu": {
            "rhel-7.4": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang+llvm-9.0.1-powerpc64le-linux-rhel-7.4.tar.xz": {
                    "sha256": "ef3e08f7afb52f7890ef11d57e488d973f042df03f63a070efa8f56923921299",
                },
            },
        },
        "x86_64-apple-darwin": {
            "*": {
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang+llvm-9.0.1-x86_64-apple-darwin.tar.xz": {
                    "sha256": "2fdb7c04fefa4cc651a8b96a5d72311efe6b4be845a08c921166dc9883b0c5b9",
                },
            },
        },
    },
}
