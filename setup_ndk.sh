#!/bin/bash
# Work only with recent ndk version >19

set -xe
NDK=$HOME/android-ndk

NDK_SYSROOT=$HOME/android-ndk/sysroot/usr
LINKER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android29-clang
AR=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar
STRIP=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-strip

SYSROOT=$NDK/sysroot/
FLAGS="[ ]" #[ \"-Clink-args=--sysroot=$NDK_SYSROOT\" ]"
mkdir -p .cargo
cat > .cargo/config <<END
[target.aarch64-linux-android]
linker = "$LINKER"
ar = "$AR"
rustflags = $FLAGS
END

echo ".cargo/config created successfully"

sudo rm -f /usr/bin/aarch64-linux-android-clang
sudo rm -f /usr/bin/aarch64-linux-android-ar
sudo rm -f /usr/bin/aarch64-linux-android-strip
sudo ln -s $LINKER /usr/bin/aarch64-linux-android-clang
sudo ln -s $AR /usr/bin/aarch64-linux-android-ar
sudo ln -s $STRIP /usr/bin/aarch64-linux-android-strip
