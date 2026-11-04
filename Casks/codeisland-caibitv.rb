cask "codeisland-caibitv" do
  version "1.0.41.1"
  sha256 "565afb513d93966666f5eb007f744a5010e6185bdd8661a40606c1c77c060b6e"

  url "https://github.com/CAIBITV/CodeIsland/releases/download/v#{version}/CodeIsland.dmg"
  name "CodeIsland (CAIBITV)"
  desc "CodeIsland 个人修改版：会话 token 用量与估算速度"
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
