#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements
dl_gh "revanced-patches" "anddea" "prerelease"
dl_gh "revanced-cli" "inotia00" "latest"

# Patch Youtube Arm64-v8a
get_patches_key "youtube-rve-anddea"
version="20.21.37"
get_apk "com.google.android.youtube" "youtube-beta" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
split_editor "youtube-beta" "youtube-beta-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
patch "youtube-beta-arm64-v8a" "anddea" "inotia"

# Patch YouTube Music Extended:
# Arm64-v8a
get_patches_key "youtube-music-rve-anddea"
version="8.24.54"
get_apk "com.google.android.apps.youtube.music" "youtube-music-beta-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
patch "youtube-music-beta-arm64-v8a" "anddea" "inotia"

# Patch Spotjfy Arm64-v8a
get_patches_key "Spotjfy-anddea"
j="i"
version="9.0.64.107"
get_apkpure "com.spot"$j"fy.music" "spotjfy-beta-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
patch "spotjfy-beta-arm64-v8a" "anddea"

# Patch Reddit Arm64-v8a:
get_patches_key "reddit-anddea"
get_apk "com.reddit.frontpage" "reddit-beta" "reddit" "redditinc/reddit/reddit" "Bundle_extract"
split_editor "reddit-beta" "reddit-arm64-v8a-beta" "exclude" "split_config.armeabi_v7a split_config.x86_64 split_config.mdpi split_config.ldpi split_config.hdpi split_config.xhdpi split_config.xxhdpi split_config.tvdpi"
patch "reddit-arm64-v8a-beta" "anddea" "inotia"
