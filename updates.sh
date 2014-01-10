#!/bin/bash

if [ -f ~/bin/paths-11.0.sh ]; then
	source ~/bin/paths-11.0.sh
fi

if [ "${android}" = "" ]; then
	android=~/android/system
fi

# camera: Fix preview on SEMC msm7x30 devices
cherries+=(CM_54582)

# gui: Allow devices to disable fence sync
cherries+=(CM_52994)
# DisplayDevice: Backwards compatibility with old EGL
cherries+=(CM_54257)

# CM PlatLogo: CyanogenMod version preference
cherries+=(CM_55037)
# Settings: Add CM PlatLogo & CMCaseView
cherries+=(CM_55041)

# Adds ability to answer call with hardware HOME button
cherries+=(CM_56094)

# SoftapControllerTI: update parameters for setSoftap
cherries+=(CM_55805)

# LockScreen: allow long-press actions from hardware keys (1/2)
cherries+=(CM_56346)
# LockScreen: allow long-press actions from hardware keys (2/2)
cherries+=(CM_56357)

# Camera button support (1/2)
cherries+=(CM_56342)
# Camera button support (2/2)
cherries+=(CM_56345)

# Performance profiles: default to 'classic' values
cherries+=(LX_16)

${android}/local_manifests/repopick.py -b ${cherries[@]}
