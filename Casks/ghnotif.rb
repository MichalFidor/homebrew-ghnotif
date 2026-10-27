cask "ghnotif" do
  version "0.3.1"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "46d6d57f29fa8fde2ef67e7443dd8b4602392ac35c3aff3ad565604af0a6aed1", intel: "94bdbc93744217022a247728f2e801555ff51e958c7e4364501fc346d20870c4"

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
