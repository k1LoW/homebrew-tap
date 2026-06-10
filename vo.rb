# typed: false
# frozen_string_literal: true

class Vo < Formula
  desc "On-device live transcription and translation CLI for macOS 26+"
  homepage "https://github.com/k1LoW/vo"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/vo/releases/download/v#{version}/vo_v#{version}_darwin_arm64.tar.gz"
      sha256 "99fc4d0a70cc6ef2c0a08f3372f339f1969af7b3a5ed86b18d85f36e6801d8c7"

      def install
        bin.install "vo"
      end
    end
  end
end
