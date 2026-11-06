# typed: false
# frozen_string_literal: true

class Isftool < Formula
  desc "Check, render and benchmark ISF shaders through VDMX's Metal path"
  homepage "https://github.com/101000lab/isftool"
  version "0.1.0"
  license "MIT"
  # isftool only ships an arm64 macOS artifact, so the URL stays at the top level
  # for the same reason as vo.rb.
  url "https://github.com/101000lab/isftool/releases/download/v#{version}/isftool_v#{version}_darwin_arm64.tar.gz"
  sha256 "45d293b8b2737b85a0a53cc4f2ca1e8bb3b765439fc9bf7d8fc55e769b480327"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos
  depends_on arch: :arm64
  on_macos do
    depends_on macos: :sonoma
  end

  def install
    bin.install "isftool"
    system "/usr/bin/xattr", "-cr", bin/"isftool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/isftool --version")
  end
end
