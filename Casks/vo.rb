cask "vo" do
  version "0.1.1"
  sha256 "99fc4d0a70cc6ef2c0a08f3372f339f1969af7b3a5ed86b18d85f36e6801d8c7"

  url "https://github.com/k1LoW/vo/releases/download/v#{version}/vo_v#{version}_darwin_arm64.tar.gz"
  name "vo"
  desc "On-device live transcription and translation CLI"
  homepage "https://github.com/k1LoW/vo"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe
  depends_on arch: :arm64

  binary "vo"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/vo"],
                   sudo: false
  end

  zap trash: "~/Library/Caches/vo"
end
