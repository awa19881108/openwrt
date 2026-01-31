#!/bin/bash
# DIY script part 1 - Before Update feeds

# 移除舊 helloworld（避免衝突）
sed -i '/helloworld/d' feeds.conf.default

# 加 sbwml 的 helloworld v5 分支（支援 24.10 的 ssr-plus）
echo "src-git helloworld https://github.com/sbwml/openwrt_helloworld.git^v5" >> feeds.conf.default

# 更新 golang（xray 等需要較新版本）
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
