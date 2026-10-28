cask "ghnotif" do
  version "0.5.2"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "2db1aa0edfe2f07c293296338234e85bc3ecd9184054faddf6b0d84bab270b78", intel: "603460cebb889f6c92b885908e5fc75fb390f8ef281954592d2e001f2a98187c"

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
