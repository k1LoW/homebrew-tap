cask "tiley" do
  version "5.3.0"
  sha256 "439800e8755d40f23f844bd4e7270d8b2cc8ecd8ca8fd1106dd4a324a4fac075"

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
