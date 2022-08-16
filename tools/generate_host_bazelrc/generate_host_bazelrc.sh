#!/usr/bin/env bash

set -euo pipefail

WORKSPACE_NAME="cc_toolchains"
PLATFORMS_PACKAGE="@${WORKSPACE_NAME}//platforms"
BAZELRC_OUTPUT="${BUILD_WORKSPACE_DIRECTORY}/host_platforms.bazelrc"

if [[ "$OSTYPE" == "linux"* ]]; then
    # TODO: Detect the correct linux flavor
    HOST_PLATFORM="${PLATFORMS_PACKAGE}:ubuntu_20"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    HOST_PLATFORM="${PLATFORMS_PACKAGE}:x86_64-apple-darwin"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    HOST_PLATFORM="${PLATFORMS_PACKAGE}:x86_64-unknown-freebsd"
else
    echo "Unexpected OSTYPE: $OSTYPE" 1>&2
    exit 1
fi

echo "common --host_platforms=${HOST_PLATFORM}" > "${BAZELRC_OUTPUT}"
