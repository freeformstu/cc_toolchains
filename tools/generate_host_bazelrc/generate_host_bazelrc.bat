@ECHO OFF

echo "common --host_platforms=@cc_toolchains//platforms:x86_64-pc-windows" > %BUILD_WORKSPACE_DIRECTORY%\host_platforms.bazelrc
