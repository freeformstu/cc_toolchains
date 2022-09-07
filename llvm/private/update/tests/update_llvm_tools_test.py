import unittest
import sys

from llvm.private.update.update_llvm_versions import triple_from_artifact


class UnitTests(unittest.TestCase):
    def test_triple_from_artifact(self) -> None:

        self.assertEqual(
            ("x86_64-unknown-linux-gnu", "ubuntu-20.04"),
            triple_from_artifact("x86_64-linux-ubuntu-20.04"),
        )

        self.assertEqual(
            ("x86_64-apple-darwin", "*"),
            triple_from_artifact("x86_64-apple-darwin"),
        )

        self.assertEqual(
            ("arm64-apple-darwin21.0", "*"),
            triple_from_artifact("aarch64-apple-darwin"),
        )

        self.assertEqual(
            ("amd64-unknown-freebsd", "freebsd-12"),
            triple_from_artifact("amd64-unknown-freebsd12"),
        )

        # https://en.wikipedia.org/wiki/IBM_AIX
        self.assertEqual(
            ("powerpc64-ibm-aix", "aix-7.2"),
            triple_from_artifact("powerpc64-ibm-aix-7.2"),
        )

        # https://en.wikipedia.org/wiki/SUSE_Linux_Enterprise
        self.assertEqual(
            ("x86_64-unknown-linux-gnu", "sles-11.3"),
            triple_from_artifact("x86_64-linux-sles11.3"),
        )

        self.assertEqual(
            ("amd64-pc-solaris", "solaris-2.11"),
            triple_from_artifact("amd64-pc-solaris2.11"),
        )

        self.assertEqual(
            ("sparcv9-sun-solaris", "solaris-2.11"),
            triple_from_artifact("sparcv9-sun-solaris2.11"),
        )

        self.assertEqual(
            ("x86_64-unknown-linux-gnu", "ubuntu-16.04"),
            triple_from_artifact("x86_64-linux-gnu-ubuntu-16.04"),
        )


if __name__ == "__main__":
    sys.exit(unittest.main())
