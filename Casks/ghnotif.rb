cask "ghnotif" do
  version "0.7.0"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "bf1c01a2fcbefafda35267edbd3ca742899b2cf12432777608d7884fec0e78c1", intel: "faab01f6d520d481756d1e088bae3c3a88ade9155a0169d4873f787f5d721993"

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
