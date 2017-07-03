#!/bin/bash

TARGET_KERNEL_SOURCE=kernel
TARGET_KERNEL_CONFIG=android-cube_i7_defconfig

cp ${TARGET_KERNEL_CONFIG} $OUT/obj/kernel/.config

pushd ${ANDROID_BUILD_TOP}

#${TARGET_KERNEL_SOURCE}/scripts/kconfig/merge_config.sh -m -n \
#                kernel/arch/x86/configs/android-x86_64_defconfig \
#                device/cube/cubei7/${TARGET_KERNEL_CONFIG} 


make -C kernel O=$OUT/obj/kernel ARCH=x86_64 xconfig

popd

#grep -v '^\#' ${ANDROID_BUILD_TOP}/kernel/arch/x86/configs/android-x86_64_defconfig | sort > orig.config && \
#grep -v '^\#' $OUT/obj/kernel/.config | sort > new.config && \
#diff --unchanged-line-format="" --old-line-format="" --new-line-format='%L' orig.config new.config > ${TARGET_KERNEL_CONFIG}
cp $OUT/obj/kernel/.config ${TARGET_KERNEL_CONFIG}

#rm orig.config 
#rm new.config
