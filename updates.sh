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
cherries+=(CM_164156)

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(CM_167387)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(CM_167388)

# Revert "Create symlink in the case where device has no cache partition"
cherries+=(CM_169160)

if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/vendor/extra/repopick.py -b ${cherries[@]}
fi
