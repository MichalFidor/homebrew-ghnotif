cask "ghnotif" do
  version "0.5.1"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "10a5620065972bab5b8a8e3807abd3d0bf6be033f312282d1b3b15a78ae6ec69", intel: "0084c8fde3a6a4fd677b234e9d1987c3d3921b2c9a7873e51632bb43123ad83f"

  url "https://github.com/MichalFidor/GHNotif/releases/download/v#{version}/GHNotif-macos-#{arch}.zip"
  name "GHNotif"
  desc "GitHub pull request review notifications"
  homepage "https://github.com/MichalFidor/GHNotif"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :sequoia"

  app "GHNotif.app"
  uninstall quit: "com.michalfidor.ghnotif"

  zap trash: [
    "~/Library/Application Support/GHNotif",
    "~/Library/Preferences/com.michalfidor.ghnotif.plist",
  ]
end
