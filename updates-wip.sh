#!/bin/bash

# [DNM] updates.sh: Holder of all patches for LegacyXperia
cherries+=(LX_1563)

# temp cam source fix for semc2011
cherries+=(LAOS_62448)

# init: set default interactive max cpu clock @1,4GHz
# cherries+=(LX_1473)

# media_profiles: Enable a working true 720p mode
# cherries+=(LX_1474)

# msm7x30-common: Use Camera HAL1
# cherries+=(LX_1481)

# [DNM] msm7x30-common: Enable call recording
cherries+=(LX_1519)

# usb: mtp: increase RX transfer length to 1M
# cherries+=(LX_1547)

# msm7x30-common: recovery: Provide TWRP 3.0.x configurations
cherries+=(LX_1550)

# Failed to load kernel modules
# cherries+=(LX_1551)

# Disable bootanimation preload and texture cache
cherries+=(LX_1567)
