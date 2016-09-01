#!/bin/bash

if [ ! -d ".repo" ]; then
    echo -e "No .repo directory found.  Is this an Android build tree?"
    exit 1
fi

android="${PWD}"

# Add local cherries if they exist
if [ -f ${android}/updates-local.sh ]; then
    source ${android}/updates-local.sh
fi

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(CM_158950)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(CM_158951)

# Revert "Remove mkyaffs2image references."
cherries+=(CM_160193)

# libbt-vendor: Add kernel header dependency
cherries+=(CM_160195)

# mkbootimg: add 32K 64K and 128K pagesizes
cherries+=(CM_160196)

# fix: use SVELTE instead of jemalloc
cherries+=(LX_1325)

# init: Use a more conventional ramdisk layout
cherries+=(LX_1327)

# init: Clean the init_sony specific binaries on boot
cherries+=(LX_1328)

# init: Prevent the new ramdisk interventions on test runs
cherries+=(LX_1329)

# init: Update header file.h to android-base for AOSP 7.0
cherries+=(LX_1330)

# init: Delete additional symlinks removal for FOTA
cherries+=(LX_1331)

# init: Allow init.real usage inside a recovery image
cherries+=(LX_1332)

# msm7x30-common: init: Use a more conventional ramdisk layout
cherries+=(LX_1333)

# msm7x30-common: boot: Colors deprecated inside Makefile rules
cherries+=(LX_1334)

# Revert "SELinux: ss: Fix policy write for ioctl operations"
cherries+=(LX_1335)

# Revert "SELinux: use deletion-safe iterator to free list"
cherries+=(LX_1336)

# Revert "SELinux: per-command whitelisting of ioctls"
cherries+=(LX_1337)

# selinux: remove unnecessary pointer reassignment
cherries+=(LX_1338)

# selinux: extended permissions for ioctls
cherries+=(LX_1339)

# selinux: Android kernel compatibility with M userspace
cherries+=(LX_1340)

# UPSTREAM: selinux: fix bug in conditional rules handling
cherries+=(LX_1341)

# msm7x30: Rewrite the custombootimg.mk for bootimage and recoveryimage
cherries+=(LX_1342)

# msm7x30: Fix global cflags
cherries+=(LX_1343)

# libinit: Update for N
cherries+=(LX_1344)

# libril: Update for N
cherries+=(LX_1345)

# libshims: Update header SharedBuffer.h for AOSP 7.0
cherries+=(LX_1346)

# libshims: Remove local SharedBuffer copy
cherries+=(LX_1347)

# msm7x30: Allow text relocations
cherries+=(LX_1348)

# msm7x30: Switch cpu variant to cortex-a8
cherries+=(LX_1349)

# msm7x30: Reduce recovery resource density
cherries+=(LX_1350)

# mogami: Fix global cflags
cherries+=(LX_1351)

# mogami: Disable BLE for now
cherries+=(LX_1352)

# policy_hal: Update for N
cherries+=(LX_1353)

if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/vendor/extra/repopick.py -b ${cherries[@]}
fi
