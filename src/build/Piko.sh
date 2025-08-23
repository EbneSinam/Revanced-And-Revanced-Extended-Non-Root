#!/bin/bash
# Twitter Piko
source src/build/utils.sh

# Patch Twitter Piko Arm64-v8a:
patch_piko () {
	dl_gh "revanced-cli" "revanced" "v4.6.0"
	get_patches_key "twitter-piko"
	local v apk_name
	if [[ "$1" == "latest" ]]; then
		v="latest" apk_name="stable"
	else
		v="prerelease" apk_name="beta"
	fi
	dl_gh "piko revanced-integrations" "crimera" "$v"
    #version="11.12.0-release.0"
	get_apk "com.twitter.android" "twitter-$apk_name" "twitter" "x-corp/twitter/x-formerly-twitter" "Bundle_extract"
	split_editor "twitter-$apk_name" "twitter-arm64-v8a-$apk_name" "exclude" "plit_config.armeabi_v7a split_config.x86 split_config.x86_64 split_config.mdpi split_config.hdpi split_config.xhdpi split_config.xxhdpi split_config.tvdpi"
	patch "twitter-arm64-v8a-$apk_name" "piko" 
}
patch_piko $1
