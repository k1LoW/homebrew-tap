cask "tiley" do
  version "5.2.1"
  sha256 "035580e5b81e0ae8f5047488253a7e8c486689f06fa74c94fca2ccff8adb73c1"

  url "https://github.com/yusuke/tiley/releases/download/v#{version}/Tiley-#{version}.zip"
  name "Tiley"
  desc "Utility to arrange windows on a customizable grid"
  homepage "https://github.com/yusuke/tiley"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Tiley.app"

  zap trash: [
    "~/Library/Application Support/one.cafebabe.tiley",
    "~/Library/Caches/one.cafebabe.tiley",
    "~/Library/Preferences/one.cafebabe.tiley.plist",
    "~/Library/Saved Application State/one.cafebabe.tiley.savedState",
  ]
end
