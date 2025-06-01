#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements
dl_gh "revanced-patches" "anddea" "prerelease"
dl_gh "revanced-cli" "inotia00" "latest"

# Patch YouTube:
get_patches_key "youtube-rve-anddea"
get_apk "com.google.android.youtube" "youtube-beta" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
split_editor "youtube-beta" "youtube-beta"
patch "youtube-beta" "anddea" "inotia"
# Patch Youtube Arm64-v8a
get_patches_key "youtube-rve-anddea"
split_editor "youtube-beta" "youtube-beta-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
patch "youtube-beta-arm64-v8a" "anddea" "inotia"

# Patch YouTube Music Extended:
# Arm64-v8a
get_patches_key "youtube-music-rve-anddea"
get_apk "com.google.android.apps.youtube.music" "youtube-music-beta-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
patch "youtube-music-beta-arm64-v8a" "anddea" "inotia"
