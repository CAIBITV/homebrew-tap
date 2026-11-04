cask "codeisland-caibitv" do
  version "1.0.41.2"
  sha256 "c3650b499576d8e7678c84d094b9b9016463f04709639454785440da22ec5391"

  url "https://github.com/CAIBITV/CodeIsland/releases/download/v#{version}/CodeIsland.dmg"
  name "CodeIsland (CAIBITV)"
  desc "刘海屏 AI 编程助手状态面板，显示会话 token 用量与估算速度"
  homepage "https://github.com/CAIBITV/CodeIsland"

  depends_on arch: :arm64

  conflicts_with cask: "wxtsky/tap/codeisland"

  app "CodeIsland.app"

  # 未经 Apple 公证，去掉隔离标记，避免 Gatekeeper 拦截
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CodeIsland.app"]
  end

  zap trash: [
    "~/.codeisland",
  ]
end
