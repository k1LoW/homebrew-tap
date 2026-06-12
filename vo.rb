# typed: false
# frozen_string_literal: true

class Vo < Formula
  desc "On-device live transcription and translation CLI for macOS 26+"
  homepage "https://github.com/k1LoW/vo"
  version "0.5.1"
  license "MIT"
  # vo only ships an arm64 macOS artifact. The URL is defined at the top level
  # (rather than inside `on_macos`) so the formula still resolves a URL when it
  # is loaded on Linux; recent Homebrew rejects a URL-less formula with "formula
  # requires at least a URL". Installation is restricted by the `depends_on`s.
  url "https://github.com/k1LoW/vo/releases/download/v#{version}/vo_v#{version}_darwin_arm64.tar.gz"
  sha256 "5031da711ab48055f73747633fb4a51b5e574e71bb96a7b918fbdbdb9ad1c906"

  livecheck do
    url :url
    strategy :github_latest
  end

  # A versioned `depends_on macos:` only sets the macOS version floor; on Linux
  # it is treated as satisfied, so the bare `:macos` is what actually keeps this
  # macOS-only formula from installing on Linux. The version floor itself lives
  # in `on_macos` because pairing it with the bare `:macos` at the top level is
  # deprecated.
  depends_on :macos
  depends_on arch: :arm64
  on_macos do
    depends_on macos: :tahoe
  end

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
