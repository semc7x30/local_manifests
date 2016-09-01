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

if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/vendor/extra/repopick.py -b ${cherries[@]}
fi
