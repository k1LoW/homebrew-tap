cask "tiley" do
  version "5.3.2"
  sha256 "afbdadec545724881da55272e99243101a2bb1c8010d774aebb8984c571bc583"

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
