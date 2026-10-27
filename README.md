# homebrew-ghnotif

Homebrew tap for [GHNotif](https://github.com/MichalFidor/GHNotif).

```sh
brew tap MichalFidor/ghnotif
brew install --cask ghnotif
```

Update with `brew upgrade --cask ghnotif`. The application is not notarized or
signed with an Apple Developer certificate; macOS may require approval on first
launch. Homebrew upgrades are explicit; GHNotif does not silently replace itself.

The GHNotif release workflow can synchronize this tap after a release. To enable
that for future releases, configure `HOMEBREW_TAP_ENABLED=true` as a repository
Actions variable and `HOMEBREW_TAP_TOKEN` as a secret with write access to this
tap. Without those settings, update `Casks/ghnotif.rb` from the generated
`ghnotif.rb` release asset.
