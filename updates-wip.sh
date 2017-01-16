#!/bin/bash

# [DNM] updates.sh: Holder of all patches for LegacyXperia
cherries+=(LX_1563)

# temp cam source fix for semc2011
cherries+=(LAOS_62448)

# [DNM] msm7x30-common: Enable call recording
cherries+=(LX_1519)

# msm7x30-common: recovery: Provide TWRP 3.0.x configurations
cherries+=(LX_1550)

# Disable bootanimation preload and texture cache
cherries+=(LX_1567)

# hardware/qcom/display
cherries+=(LX_1600)

# hardware/qcom/media
cherries+=(LX_1601)
cherries+=(LX_1602)
cherries+=(LX_1603)
cherries+=(LX_1604)
