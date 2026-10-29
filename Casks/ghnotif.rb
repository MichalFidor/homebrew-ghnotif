cask "ghnotif" do
  version "0.5.4"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "f3f62a8c6ee2c3fa6c3c5aee340bfc7802e75229f45c739fbcc7d4d75bc6e5bb", intel: "e683e8eb88092513105e32e26b06bfc9440b7dffcb8c1a204b5b412378a56113"

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
