cask "codexbar" do
  version "0.31.1"
  sha256 "fa585ad3bd768b49db4f0f11a31ec0f3ad4b30ef2f1b850529d2c03944b53d8d"

  url "https://github.com/chanwutk/CodexBar/releases/download/v#{version}/CodexBar-macos-universal-#{version}.zip",
      verified: "github.com/chanwutk/CodexBar/"
  name "CodexBar"
  desc "Menu bar usage monitor for AI coding providers"
  homepage "https://github.com/chanwutk/CodexBar"

  depends_on macos: ">= :ventura"

  app "CodexBar.app"
  binary "#{appdir}/CodexBar.app/Contents/Helpers/CodexBarCLI", target: "codexbar"

  # This is an ad-hoc signed community build (not Apple-notarized), so macOS
  # Gatekeeper would otherwise block first launch. Strip the quarantine flag
  # that Homebrew applies to the downloaded app on install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CodexBar.app"],
                   sudo: false
  end

  caveats <<~EOS
    CodexBar is distributed as an ad-hoc signed build (no paid Apple Developer ID).
    The install step removes the quarantine flag so it launches normally. If macOS
    still blocks it, right-click the app and choose Open, or run:
      xattr -dr com.apple.quarantine "/Applications/CodexBar.app"
  EOS

  zap trash: [
    "~/Library/Application Scripts/com.chanwutk.codexbar",
    "~/Library/Application Scripts/com.chanwutk.codexbar.widget",
    "~/Library/Application Support/CodexBar",
    "~/Library/Application Support/com.chanwutk.codexbar",
    "~/Library/Caches/CodexBar",
    "~/Library/Caches/com.chanwutk.codexbar",
    "~/Library/Containers/com.chanwutk.codexbar",
    "~/Library/Containers/com.chanwutk.codexbar.widget",
    "~/Library/HTTPStorages/com.chanwutk.codexbar",
    "~/Library/HTTPStorages/com.chanwutk.codexbar.binarycookies",
    "~/Library/Preferences/com.chanwutk.codexbar.plist",
    "~/Library/Saved Application State/com.chanwutk.codexbar.savedState",
    "~/Library/WebKit/com.chanwutk.codexbar",
  ]
end
