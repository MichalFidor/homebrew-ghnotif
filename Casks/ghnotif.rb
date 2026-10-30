cask "ghnotif" do
  version "0.7.3"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "41f9d8710d41032332668acef96c51642766be70336ca1ff724221e581271905", intel: "3b2abd76972a8fcb7daef8c0b4c28a58b358f26aafe39d796b17a08d789c1e6b"

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
