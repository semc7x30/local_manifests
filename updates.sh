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

# sad selinux 2002
cherries+=(CM_158521)

# linker: Make text relocations denial optional
cherries+=(CM_158551)

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(CM_158950)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(CM_158951)

# msm7x30: Allow text relocations
cherries+=(LX_1348)

# msm7x30: Switch cpu variant to cortex-a8
cherries+=(LX_1349)

# msm7x30: Reduce recovery resource density
cherries+=(LX_1350)

# policy_hal: Update for N
cherries+=(LX_1353)

if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/vendor/extra/repopick.py -b ${cherries[@]}
fi
