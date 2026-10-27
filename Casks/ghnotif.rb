cask "ghnotif" do
  version "0.4.1"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "60657ba1dc95f34a26238072b1e32656ac59b33031d67116c4a5ec873159aeac", intel: "d9ea30543f08bf2bf82005b6fe1a9b8da5dc138fcd51d15596c3332740826142"

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
