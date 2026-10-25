cask "thaw" do
  # Thaw 1.x is the last line supporting macOS 14/15 (Thaw 2 requires macOS 26).
  # pinned: do not auto-update
  version "1.2.0"
  sha256 "d67f4d31ef9fa057849a98540b810cfa42e0bc66019d3605abd08e45c69aa06f"

  url "https://github.com/thaw-app/Thaw/releases/download/#{version}/Thaw_#{version}.zip"
  name "Thaw"
  desc "Menu bar manager"
  homepage "https://github.com/thaw-app/Thaw"

  auto_updates true
  depends_on macos: :sonoma

  app "Thaw.app"

  zap trash: [
    "~/Library/Application Support/com.stonerl.Thaw",
    "~/Library/Caches/com.stonerl.Thaw",
    "~/Library/Preferences/com.stonerl.Thaw.plist",
  ]
end
