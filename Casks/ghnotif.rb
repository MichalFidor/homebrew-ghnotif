cask "ghnotif" do
  version "0.2.0"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "dbd245d6bc2b84d8843a41364c8f7fa363c213a1d36899e117b6cc6cbe459b99", intel: "5b7574feea0ff0cd0566c4707b09e692e26acb12c7024cf7714c196d12854e43"

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
