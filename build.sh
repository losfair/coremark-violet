#!/bin/sh

TOOL_PREFIX="/home/zhy/Projects/OrangeCore/Scripts"

make PORT_DIR=violet-baremetal compile || exit 1
rust-objcopy \
    ./coremark.exe \
    --binary-architecture=riscv32 --strip-all -O binary \
    firmware.bin || exit 1
python3 $TOOL_PREFIX/im_encode.py < firmware.bin > im.txt || exit 1
python3 $TOOL_PREFIX/dm_encode.py dm < firmware.bin || exit 1
