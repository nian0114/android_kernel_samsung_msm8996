#!/bin/bash

export ARCH=arm64
export SEC_BUILD_OPTION_HW_REVISION=02
export PATH=~/aarch64-linux-android-4.9/bin:$PATH
export CROSS_COMPILE=aarch64-linux-android-
mkdir out

make hero2qlte_chn_open_defconfig

make -j8

rm arch/arm64/boot/dts/samsung/*.dtb

make dtbs

tools/dtbTool -o dt.img -s 4096 -p scripts/dtc/ arch/arm64/boot/dts/samsung/

tar -cvf boot_edge.tar arch/arm64/boot/Image.gz dt.img

make clean
make mrproper

make heroqlte_chn_open_defconfig

make -j8

rm arch/arm64/boot/dts/samsung/*.dtb

make dtbs

tools/dtbTool -o dt.img -s 4096 -p scripts/dtc/ arch/arm64/boot/dts/samsung/

tar -cvf boot.tar arch/arm64/boot/Image.gz dt.img
