#!/bin/bash
# DIY part1 - Before feeds update


# cd openwrt || exit 1

# 移除舊 helloworld/mosdns 避免重複
sed -i '/helloworld/d' feeds.conf.default
sed -i '/mosdns/d' feeds.conf.default

# 加 sbwml helloworld v5
echo "src-git helloworld https://github.com/sbwml/openwrt_helloworld.git^v5" >> feeds.conf.default

# 加 sbwml mosdns v5（修 ssr-plus 依賴）
echo "src-git mosdns https://github.com/sbwml/luci-app-mosdns.git^v5" >> feeds.conf.default

# golang 更新
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

# PassWall2 feed（如果要）
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;luci" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default

# 顯示 feeds.conf 內容確認
cat feeds.conf.default
