cask "capsomnia" do
  version "3.1.1"
  sha256 "795c9c62684da5c6adf063cb0fc8e7fdd670cfcbb5e922e6b4dcf58796e8c34e"

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
