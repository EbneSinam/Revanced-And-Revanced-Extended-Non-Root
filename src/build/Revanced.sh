#!/bin/bash
# Revanced build
source ./src/build/utils.sh
# Download requirements
revanced_dl(){
	dl_gh "revanced-patches revanced-cli" "revanced" "latest"
}
1() {
	revanced_dl
	# Patch Spotjfy Arm64-v8a
	get_patches_key "Spotjfy-revanced"
	j="i"
        version="9.0.64.586"
	get_apkpure "com.spot"$j"fy.music" "spotjfy-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music" #"Bundle_extract"
	#split_editor "spotjfy" "spotjfy-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "spotjfy-arm64-v8a" "revanced"

	# Patch Twitch Arm64-v8a:
	get_patches_key "twitch"
	get_apk "tv.twitch.android.app" "twitch-arm64-v8a" "twitch" "twitch-interactive-inc/twitch/twitch" "Bundle_extract"
	split_editor "twitch" "twitch-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "twitch-arm64-v8a" "revanced"
}
case "$1" in
    1)
        1
        ;;
esac
