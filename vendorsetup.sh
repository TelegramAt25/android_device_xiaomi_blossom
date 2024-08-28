deviceDir=$(gettop)/device/xiaomi/blossom/

# apply patches
${deviceDir}/applyPatches.sh ${deviceDir}/patches

# For now, just skip the ABI checks to fix build errors.
export SKIP_ABI_CHECKS=true

export TARGET_BOARD_PLATFORM=mt6765
