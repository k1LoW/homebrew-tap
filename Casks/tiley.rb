cask "tiley" do
  version "5.3.1"
  sha256 "1bfc02634283e779f7258a3c9e7dddb380a3f32a3c24ea902cde4948056e6141"

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
