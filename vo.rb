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
        # The downloaded tarball inherits `com.apple.quarantine` from the macOS
        # network stack (LaunchServices marks archive downloads regardless of
        # the HTTP client used), and `tar -x` carries the attribute over to the
        # extracted binary. Gatekeeper would then refuse to launch the
        # ad-hoc-signed binary on first run. Strip the attribute explicitly so
        # the installed binary works without `xattr -cr` from the user.
        system "/usr/bin/xattr", "-cr", bin/"vo"
      end
    end
  end
end
