#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
# Modify Openwrt to AXT1800
sed -i 's/'OpenWrt'/'GL-AXT1800'/g' package/base-files/files/bin/config_generate
# remove strongswan-mod-kdf to enable luci-app-ipsec*
sed -i '/strongswan-mod-kdf/d' package/feeds/packages/strongswan/Makefile
# adjust fan speed
sed -i 's/define\ MAX_TEMP\ 120/define\ MAX_TEMP\ 83/g' package/feeds/kiddin9/fancontrol/src/fancontrol.c
# fix gn
sed -i '/define Host\/Compile/a HOST_MAKE_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++2a"' package/feeds/kiddin9/gn/Makefile
