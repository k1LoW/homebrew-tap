# typed: false
# frozen_string_literal: true

class Vo < Formula
  desc "On-device live transcription and translation CLI for macOS 26+"
  homepage "https://github.com/k1LoW/vo"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/vo/releases/download/v#{version}/vo_v#{version}_darwin_arm64.tar.gz"
      sha256 "6e8e4b017f4b4b2598e5f8c351f18c0b29aa1c3958a54c24da74a1336ac27cd6"

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
