#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements
dl_gh "revanced-patches" "anddea" "latest"
dl_gh "revanced-cli" "inotia00" "latest"

# Patch Youtube Arm64-v8a:
get_patches_key "youtube-rve-anddea"
get_apk "com.google.android.youtube" "youtube-stable" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
split_editor "youtube-stable" "youtube-stable-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
patch "youtube-stable-arm64-v8a" "anddea" "inotia"

# Patch YouTube Music Arm64-v8a:
get_patches_key "youtube-music-rve-anddea"
get_apk "com.google.android.apps.youtube.music" "youtube-music-stable-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
patch "youtube-music-stable-arm64-v8a" "anddea" "inotia"

# Patch Spotjfy Arm64-v8a
# get_patches_key "Spotjfy-anddea"
# j="i"
# get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
# patch "spotjfy-arm64-v8a" "anddea"
