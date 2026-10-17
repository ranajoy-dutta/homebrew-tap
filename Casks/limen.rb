cask "limen" do
  version "0.3.0"
  sha256 "b68267117648692fc239aecede4d403b3c637caf0d42230d06a63550c9ae7c09"

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