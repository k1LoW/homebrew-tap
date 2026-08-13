cask "capsomnia" do
  version "3.1.0"
  sha256 "48ba4123b411ae1685abec7a22d46385a6cd5d9ffb51aabfa2c56cb3b857f0ca"

  url "https://github.com/fuji-mak/Capsomnia/releases/download/v#{version}/Capsomnia-#{version}.pkg"
  name "Capsomnia"
  desc "Turns Caps Lock into a physical keep-awake switch for closed-lid MacBook work"
  homepage "https://github.com/fuji-mak/Capsomnia"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  pkg "Capsomnia-#{version}.pkg"

  uninstall launchctl: "com.github.fuji-mak.capsomnia",
            pkgutil:   "com.github.fuji-mak.capsomnia.pkg",
            delete:    [
              "/etc/sudoers.d/capsomnia",
              "/Library/LaunchAgents/com.github.fuji-mak.capsomnia.plist",
              "/Library/PrivilegedHelperTools/capsomnia-pmset",
            ]

  zap trash: [
    "~/Library/Caches/com.github.fuji-mak.capsomnia",
    "~/Library/Preferences/com.github.fuji-mak.capsomnia.plist",
    "~/Library/Saved Application State/com.github.fuji-mak.capsomnia.savedState",
  ]
end
