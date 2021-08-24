# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Octocov < Formula
  desc "octocov is a tool for collecting code metrics."
  homepage "https://github.com/k1LoW/octocov"
  version "0.16.0"
  license "MIT"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/octocov/releases/download/v0.16.0/octocov_v0.16.0_darwin_amd64.zip"
      sha256 "7b83600a52ed6624f4895366a24913509fbcdd9a26edf494cf1e2aa1654eaa97"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/octocov/releases/download/v0.16.0/octocov_v0.16.0_linux_amd64.tar.gz"
      sha256 "81d252c4a561b318bca49ebdaf92c801161e4109be6d3c098e7d4c8299485024"
    end
  end

  def install
    system './octocov', 'completion', 'bash', 'octocov.bash'
    system './octocov', 'completion', 'zsh', 'octocov.zsh'
    bin.install 'octocov'
    bash_completion.install 'octocov.bash' => 'octocov'
    zsh_completion.install 'octocov.zsh' => '_octocov'
  end
end
