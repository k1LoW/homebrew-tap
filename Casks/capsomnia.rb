cask "capsomnia" do
  version "4.2.2"
  sha256 "19a726c1ec5b076b60f34ece0de48adcfb34b65e991bab9f5ac22dc6e3ebcdd5"

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
