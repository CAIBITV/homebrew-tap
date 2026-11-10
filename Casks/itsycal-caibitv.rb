cask "itsycal-caibitv" do
  version "0.28.0-caibitv.1"
  sha256 "96e80d4db9cc284fcef87eba607ef1fb15c4b340ffcdaa9d1cd8ecf5710b5c13"

  url "https://github.com/CAIBITV/Itsycal/releases/download/v#{version}/Itsycal.zip"
  name "Itsycal"
  desc "支持独立时区和地区节假日日历的菜单栏日历"
  homepage "https://github.com/CAIBITV/Itsycal"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  conflicts_with cask: "itsycal"

  app "Itsycal.app"

  caveats <<~EOS
    本版本使用临时签名。首次打开时如果被 macOS 拦截，
    可以在「系统设置 → 隐私与安全性」中为 Itsycal 选择「仍要打开」。
  EOS
end
