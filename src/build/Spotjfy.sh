#!/bin/bash
# $potjfy build
source src/build/utils.sh

# Download requirements
dl_gh "revanced-patches" "anddea" "prerelease"
dl_gh "revanced-cli" "inotia00" "latest"
# Patch Spotjfy Arm64-v8a
get_patches_key "Spotjfy-anddea"
j="i"
get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
patch "spotjfy-arm64-v8a" "anddea"
