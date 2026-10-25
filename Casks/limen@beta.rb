cask "limen@beta" do
  version "0.4.0-rc"
  sha256 "8564c82367a710e54fa0d3517ad7501f3a6f41eb1850367397d6639dc626403f"

  url "https://github.com/ranajoy-dutta/limen/releases/download/v#{version}/Limen_#{version}_aarch64.dmg"
  name "Limen (Beta)"
  desc "Menu bar AWS credential switcher for IAM Identity Center (Pre-release)"
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
