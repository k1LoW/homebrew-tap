cask "tiley" do
  version "5.1.7"
  sha256 "0388d1616537e8a023659895b2877b03b07005598c68f3a038911b492c3f0bef"

  url "https://github.com/yusuke/tiley/releases/download/v#{version}/Tiley-#{version}.zip"
  name "Tiley"
  desc "Utility to arrange windows on a customizable grid"
  homepage "https://github.com/yusuke/tiley"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Tiley.app"

  zap trash: [
    "~/Library/Application Support/one.cafebabe.tiley",
    "~/Library/Caches/one.cafebabe.tiley",
    "~/Library/Preferences/one.cafebabe.tiley.plist",
    "~/Library/Saved Application State/one.cafebabe.tiley.savedState",
  ]
end
