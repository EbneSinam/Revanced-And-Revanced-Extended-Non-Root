#!/bin/bash
# ReVanced Experiments  build 
source src/build/utils.sh

#################################################

# Download requirements
dl_gh "ReVancedExperiments" "Aunali321" "latest"
dl_gh "revanced-cli" "revanced" "latest"

#################################################

# Patch Instagram:
get_patches_key "instagram-revanced-experiments"
version="384.0.0.46.83"
get_apk "com.instagram.android" "instagram-arm64-v8a" "instagram-instagram" "instagram/instagram-instagram/instagram-instagram" "arm64-v8a" "Bundle_extract"
patch "instagram-arm64-v8a" "revanced-experiments"
