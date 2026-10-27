cask "ghnotif" do
  version "0.3.0"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "30aeccb5af6be926b7541d38aef55b6aefa1c408336fc50f1b6398cfdda13f77", intel: "601c1ca560735579c83399b501b87784174324bd36508528ea596d38f7de9928"

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
