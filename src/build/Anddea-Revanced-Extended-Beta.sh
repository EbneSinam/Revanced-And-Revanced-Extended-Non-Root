#!/bin/bash
# Revanced Extended forked by Anddea build
source src/build/utils.sh
# Download requirements

anddea_dl(){
	dl_gh "revanced-patches" "anddea" "prerelease"
	dl_gh "morphe-cli" "MorpheApp" "latest"
}

1() {
	anddea_dl
	# Patch YouTube:
	get_patches_key "youtube-rve-anddea"
	get_apk "com.google.android.youtube" "youtube-beta" "youtube" "google-inc/youtube/youtube"
	# Remove unused architectures
	for i in {0..3}; do
		apk_editor "youtube-beta" "${archs[i]}" ${libs[i]}
	done
	# Patch Youtube Arm64-v8a
	get_patches_key "youtube-rve-anddea"
	patch "youtube-beta-arm64-v8a" "anddea" "morphe"
}
2() {
	anddea_dl
	# Patch YouTube Music Extended:
	# Arm64-v8a
	get_patches_key "youtube-music-rve-anddea"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-beta-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
	patch "youtube-music-beta-arm64-v8a" "anddea" "morphe"
}
case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
esac
