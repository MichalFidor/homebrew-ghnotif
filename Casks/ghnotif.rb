cask "ghnotif" do
  version "0.7.1"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "91862c7eb372eff846714bfe2344fa24d74b67ed6308366abd15b97e985951ae", intel: "1176fb6a38a8307342925923487a63b0d0d7d05a8758cc6451a164e71d484f27"

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
