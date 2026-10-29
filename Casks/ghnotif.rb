cask "ghnotif" do
  version "0.5.3"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "9c1d3f2fb2eb9b1ea90bc036fda699fa58cdd0a4a1fa8e9c903d90d289fa17ec", intel: "5791eca783353eb571085fa7b41bd11f633acbe258eeee313d030e6d37319377"

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
