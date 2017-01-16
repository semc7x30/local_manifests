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

# selinux: add selinux_status_getenforce to header
cherries+=(LAOS_60713)

# init: don't skip starting a service with no domain if permissive
cherries+=(LAOS_142846)

# Revert "Revert "Reenable support for non-PIE executables""
cherries+=(LAOS_1175)

# arm: Allow disabling PIE for dynamically linked executables
cherries+=(LAOS_2643)

########################################################################

# [DNM] updates.sh: Holder of all patches for LegacyXperia
cherries+=(LX_1563)

# temp cam source fix for semc2011
cherries+=(LAOS_62448)

# bootanimation: Adapt for small display sizes
cherries+=(LAOS_156542)

# init: set default interactive max cpu clock @1,4GHz
cherries+=(LX_1473)

# media_profiles: Enable a working true 720p mode
cherries+=(LX_1474)

# [DNM] msm7x30-common: Enable call recording
cherries+=(LX_1519)

# usb: mtp: increase RX transfer length to 1M
cherries+=(LX_1547)

# msm7x30-common: recovery: Provide TWRP 3.0.x configurations
cherries+=(LX_1550)

# Failed to load kernel modules
cherries+=(LX_1551)

# Reduce zRam size to 64 mb
cherries+=(LX_1561)

# Change the name of torch overlay parameter
cherries+=(LX_1562)

# Revert "msm7x30-common: Enable adaptive LMK"
cherries+=(LX_1564)

# Do not set ro.config.max_starting_bg
cherries+=(LX_1565)

# Reduce background apps limit to 8
cherries+=(LX_1566)

# Disable bootanimation preload and texture cache
cherries+=(LX_1567)

########################################################################

if [ -z $cherries ]; then
    echo -e "Nothing to cherry-pick!"
else
    ${android}/vendor/extra/repopick.py -b ${cherries[@]}
fi
