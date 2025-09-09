#!/bin/bash
# Revanced build
source ./src/build/utils.sh
# Download requirements
revanced_dl(){
	dl_gh "revanced-patches" "revanced" "prerelease"
 	dl_gh "revanced-cli" "revanced" "latest"
}
1() {
	revanced_dl
	# Patch Spotjfy Arm64-v8a
	get_patches_key "Spotjfy-revanced"
	j="i"
 	version="9.0.74.1121"
	get_apkpure "com.spot"$j"fy.music" "spotjfy-beta-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music" #"Bundle_extract"
 	#split_editor "spotjfy-beta" "spotjfy-beta-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "spotjfy-beta-arm64-v8a" "revanced"

 	# Patch Twitch Arm64-v8a:
	get_patches_key "twitch"
	get_apk "tv.twitch.android.app" "twitch-beta-arm64-v8a" "twitch" "twitch-interactive-inc/twitch/twitch-live-streaming" "Bundle_extract"
	split_editor "twitch-beta" "twitch-beta-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "twitch-beta-arm64-v8a" "revanced"

	# Patch SoundCloud Arm64-v8a:
	get_patches_key "soundcloud"
        version="2025.09.04-release"
	get_apk "com.soundcloud.android" "soundcloud-beta" "soundcloud-soundcloud" "soundcloud/soundcloud-soundcloud/soundcloud-the-music-you-love" "Bundle_extract"
	split_editor "soundcloud-beta" "soundcloud-arm64-v8a-beta" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "soundcloud-arm64-v8a-beta" "revanced"
}
case "$1" in
    1)
        1
        ;;
esac
