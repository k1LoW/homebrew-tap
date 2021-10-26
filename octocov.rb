# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Octocov < Formula
  desc "octocov is a tool for collecting code metrics."
  homepage "https://github.com/k1LoW/octocov"
  version "0.26.0"
  license "MIT"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/octocov/releases/download/v0.26.0/octocov_v0.26.0_darwin_amd64.zip"
      sha256 "51b3343690bbf74d915255ba41656d58cefe2070cb008f1960246dd37785a619"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/octocov/releases/download/v0.26.0/octocov_v0.26.0_linux_amd64.tar.gz"
      sha256 "30c679cdcd6d0112250aff205b8bc0e7767d27925926e416165da5f9bddc7b55"
    end
  end

  def install
    bin.install 'octocov'
    output = Utils.safe_popen_read("#{bin}/octocov", 'completion', 'bash')
    (bash_completion/'octocov').write output
    output = Utils.safe_popen_read("#{bin}/octocov", 'completion', 'zsh')
    (zsh_completion/'_octocov').write output
  end
end
