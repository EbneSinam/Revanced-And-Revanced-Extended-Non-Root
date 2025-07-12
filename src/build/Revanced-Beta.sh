#!/bin/bash
# Revanced build
    # این خط برای مطابقت با نام پوشه شما تغییر کرده است
    get_patches_key "Spotjfy-revanced"
	
 	version="9.0.62.603"
    
	get_apk "com.spot${j}fy.music" "spotjfy-beta-arm64-v8a" "spot${j}fy-music-podcasts" "spot${j}fy-ab/spot${j}fy-music-podcasts/spot${j}fy-music-and-podcasts" "nodpi"
    
    patch "spotjfy-beta-arm64-v8a" "revanced"
}

case "$1" in
    1)
        patch_spotify
        ;;
esac
