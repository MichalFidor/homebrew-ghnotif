cask "ghnotif" do
  version "0.5.0"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "957dbc28f374ff58c14deb82d44d0eaff86fea4f05aac70fce4b325b05a594fa", intel: "26352fedd8092b3cb786d460c30cb5d5b3cf09caf80e9e8d5d41ecb748034c10"

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
