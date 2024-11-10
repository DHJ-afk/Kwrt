#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

#bash $SHELL_FOLDER/../common/kernel_6.1.sh

#rm -rf package/kernel/mac80211

#git_clone_path c640f7b93736621b4d56627e4f6ab824093f9c3d https://github.com/openwrt/openwrt package/kernel/mac80211

git_clone_path master https://github.com/rmoyulong/OneCloud_OpenWrt lede6.6/target/linux/amlogic && mv -f lede6.6/target/linux/amlogic target/linux/

mv -f gen_aml_emmc_img.sh target/linux/amlogic/image/

chmod +x target/linux/amlogic/image/gen_aml_emmc_img.sh

sed -i "s/wpad-openssl/wpad-basic-mbedtls/" target/linux/amlogic/image/Makefile

sed -i "s/neon-vfpv4/vfpv4/" target/linux/amlogic/meson8b/target.mk

rm -rf package/feeds/routing/batman-adv

