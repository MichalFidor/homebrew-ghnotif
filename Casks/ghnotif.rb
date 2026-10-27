cask "ghnotif" do
  version "0.4.0"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "12bc2de222eaef4d9f4e06c6c2a2098ed22738ef236f9710dca22037aa16fbcf", intel: "d4d5958ae2738551786d95d96fb46cb478e3e615b3cad06865cd4dd59bea9ba3"

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
