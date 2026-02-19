#!/bin/bash
# Morphe build
source ./src/build/utils.sh
# Download requirements
morphe_dl(){
	dl_gh "morphe-patches" "MorpheApp" "prerelease"
	dl_gh "morphe-cli" "MorpheApp" "latest"
}
1() {
	morphe_dl
	# Patch YouTube:
	get_patches_key "youtube-morphe"
	prefer_version="21.08.261"
	get_apk "com.google.android.youtube" "youtube-beta" "youtube" "google-inc/youtube/youtube"
	# Remove unused architectures
	for i in {0..3}; do
	  apk_editor "youtube-beta" "${archs[i]}" ${libs[i]}
	done
	# Patch Youtube Arm64-v8a
	get_patches_key "youtube-morphe"
	patch "youtube-beta-arm64-v8a" "morphe" "morphe"
	
}
2() {
	morphe_dl
	# Patch Reddit Arm64-v8a:
	get_patches_key "reddit-morphe"
	get_apk "com.reddit.frontpage" "reddit-beta" "reddit" "redditinc/reddit/reddit" "Bundle_extract"
	split_editor "reddit-beta" "reddit-arm64-v8a-beta" "exclude" "split_config.armeabi_v7a split_config.x86_64 split_config.mdpi split_config.ldpi split_config.hdpi split_config.xhdpi split_config.xxhdpi split_config.tvdpi"
	patch "reddit-arm64-v8a-beta" "morphe" "morphe"
}
3() {
	morphe_dl
	# Patch YouTube Music:
	# Arm64-v8a
	get_patches_key "youtube-music-morphe"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-beta-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
	patch "youtube-music-beta-arm64-v8a" "morphe" "morphe"
}
case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
    3)
        3
        ;;
esac
