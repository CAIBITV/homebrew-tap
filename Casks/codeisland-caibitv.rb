cask "codeisland-caibitv" do
  version "1.0.41.3"
  sha256 "bbc6a7b32bb19ba7b8affebbdde008d47156a58779acf4c7bcc982a4bd6be9fd"

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
