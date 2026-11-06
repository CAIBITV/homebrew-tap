cask "clash-verge-rev-caibitv" do
  version "2.5.10-caibitv.1"
  sha256 "f4d0c31267b84fa85d5a62109015b47f18a79cb42ab543b0e17384e8cf0f0591"

  url "https://github.com/CAIBITV/clash-verge-rev/releases/download/v#{version}/Clash-Verge_#{version}_aarch64.dmg"
  name "Clash Verge Rev (CAIBITV)"
  desc "Clash Verge Rev 修复版：托盘显示订阅节点延迟"
  homepage "https://github.com/CAIBITV/clash-verge-rev"

  depends_on arch: :arm64

  conflicts_with cask: "clash-verge-rev"

  app "Clash Verge.app"

  # 未经 Apple 公证，去掉隔离标记，避免 Gatekeeper 拦截
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Clash Verge.app"]
  end
end
