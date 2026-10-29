cask "ghnotif" do
  version "0.6.1"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "5ca2ff9c1cc6743ec8a93670a8c1e6e9f3255cd2772f19061fb3627c2350d517", intel: "350391f632dc183e3128da9dd6b7b23ee77d72e09ac05783f78772fd51d62887"

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
