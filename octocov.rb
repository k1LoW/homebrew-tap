# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Octocov < Formula
  desc "octocov is a tool for collecting code metrics."
  homepage "https://github.com/k1LoW/octocov"
  version "0.13.0"
  license "MIT"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/octocov/releases/download/v0.13.0/octocov_v0.13.0_darwin_amd64.zip"
      sha256 "16dba9a6c10e0b7483442300712c69638574db1ccbadadc8d24db5968658a96f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/octocov/releases/download/v0.13.0/octocov_v0.13.0_linux_amd64.tar.gz"
      sha256 "3cf24b3d0dc9f3b69b1f6972eecb3bbe41c7380e856f5738b61a9a24b9ada8eb"
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
