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
	# Patch Twitch Arm64-v8a:
	get_patches_key "twitch"
	get_apk "tv.twitch.android.app" "twitch-beta" "twitch" "twitch-interactive-inc/twitch/twitch-live-streaming" "Bundle_extract"
	split_editor "twitch-beta" "twitch-arm64-v8a-beta" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "twitch-arm64-v8a-beta" "revanced"
}
2() {
	revanced_dl
	# Patch SoundCloud Arm64-v8a:
	get_patches_key "soundcloud"
	get_apk "com.soundcloud.android" "soundcloud-beta" "soundcloud-soundcloud" "soundcloud/soundcloud-soundcloud/soundcloud-play-music-songs" "Bundle_extract"
	split_editor "soundcloud-beta" "soundcloud-arm64-v8a-beta" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "soundcloud-arm64-v8a-beta" "revanced"
}
# 3() {
	# revanced_dl
	# Patch Spotjfy Arm64-v8a:
	# j="i"
	# get_patches_key "Spotjfy-revanced"
	# get_apkpure "com.spot"$j"fy.music" "spotjfy-beta-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
	# patch "spotjfy-beta-arm64-v8a" "revanced"
# }
case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
    # 3)
        # 3
        # ;;
esac
