cask "ghnotif" do
  version "0.6.0"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "d44f981771e3f71c3ac81380d7dcca1fd9a74f40bcb690d3cd028ab3cf7bc3ff", intel: "d5690ae3ee60b974037a6cf4d7bcd839aec7e35142a1306cc79c91e8d33d3801"

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
