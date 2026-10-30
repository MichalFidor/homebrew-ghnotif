cask "ghnotif" do
  version "0.7.2"
  arch arm: "arm64", intel: "x86_64"
  sha256 arm: "2782df6d9b8372f5971d4e684595b9bb29539cd921b88ac7c903ccfb6948f740", intel: "2853590e027111fb4d074d9155ef44df6f2ae19580873ad041d8b1d09bedd7a2"

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
