#!/bin/bash
pushd ${ANDROID_BUILD_TOP}

. ./build/envsetup.sh
lunch android_cubei7-userdebug && \
make -C kernel O=$OUT/obj/kernel ARCH=x86 xconfig

popd

grep -v '^\#' ${ANDROID_BUILD_TOP}/kernel/arch/x86/configs/android-x86_64_defconfig | sort > orig.config && \
grep -v '^\#' $OUT/obj/kernel/.config | sort > new.config && \
diff --unchanged-line-format="" --old-line-format="" --new-line-format='%L' orig.config new.config > android-cube_i7_defconfig

rm orig.config 
rm new.config
