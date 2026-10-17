cask "limen" do
  version "0.2.0"
  sha256 "b1586910f2ace2e6ebc417a465d13fef4f48a7e23713af355c0cf48ebbf9d7cb"

  url "https://github.com/ranajoy-dutta/limen/releases/download/v#{version}/Limen_#{version}_aarch64.dmg"
  name "Limen"
  desc "Menu bar AWS credential switcher for IAM Identity Center"
  homepage "https://github.com/ranajoy-dutta/limen"

  depends_on macos: :monterey

  app "Limen.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Limen.app"]
  end

  zap trash: [
    "~/.aws/credentials",
    "~/Library/Application Support/com.limen.desktop",
    "~/Library/Caches/com.limen.desktop",
    "~/Library/WebKit/com.limen.desktop",
  ]
end