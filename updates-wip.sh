#!/bin/bash

# [DNM] updates.sh: Holder of all patches for LegacyXperia
cherries+=(LX_1563)

# temp cam source fix for semc2011
cherries+=(LAOS_62448)

# TWRP changes
cherries+=(LX_1550)
cherries+=(LX_1585)
cherries+=(OMNI_21655)
cherries+=(OMNI_22096)

# init: override default minfree values for LMK
cherries+=(LX_1608)

# msm7x30-common: Enable dex preoptimization
cherries+=(LX_1609)
