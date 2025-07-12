#!/bin/bash
# Revanced build

# مسیر صحیح به فایل توابع
source "$(dirname "$0")/utils.sh"

# تابع برای دانلود ابزارهای مورد نیاز
revanced_dl(){
	dl_gh "revanced-patches" "revanced" "prerelease"
 	dl_gh "revanced-cli" "revanced" "latest"
}

patch_spotify() {
    revanced_dl

    # متغیر "j" برای بقیه موارد استفاده می‌شود
    local j="i"
    
	# Patch Spotify Arm64-v8a
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
