cask "korg-kontrol-editor" do
  # The download URL contains an opaque hash, so update-cask.sh cannot derive it from the version.
  # pinned: do not auto-update
  version "2.5.1"
  sha256 "49f6a969918786ce5c40b61aff10cc04eec30705721ad191285fab6143b67606"

  url "https://cdn.korg.com/us/support/download/files/51314b09ecff2e15eb3a4a57ac23e49c.dmg"
  name "KORG KONTROL Editor"
  desc "Editor for KORG nano/micro series and Keystage MIDI controllers"
  homepage "https://www.korg.com/us/support/download/software/0/159/1355/"

  depends_on :macos

  suite "KORG KONTROL EDITOR"

  zap trash: [
    "~/Library/Preferences/jp.co.korg.KontrolEditor.plist",
    "~/Library/Saved Application State/jp.co.korg.KontrolEditor.savedState",
  ]
end
