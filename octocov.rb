# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Octocov < Formula
  desc "octocov is a tool for collecting code coverage."
  homepage "https://github.com/k1LoW/octocov"
  version "0.1.1"
  license "MIT"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/k1LoW/octocov/releases/download/v0.1.1/octocov_v0.1.1_darwin_amd64.zip"
    sha256 "2d8f783b46090a4ef038d21be56308b5b273c4dcd86f07162226d46eeaab0b72"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/k1LoW/octocov/releases/download/v0.1.1/octocov_v0.1.1_linux_amd64.tar.gz"
    sha256 "114cd90a31c5e5b171633f750eea947ded4488de6a41006b051d385df78f1930"
  end

  def install
    system './octocov', 'completion', 'bash', 'octocov.bash'
    system './octocov', 'completion', 'zsh', 'octocov.zsh'
    bin.install 'octocov'
    bash_completion.install 'octocov.bash' => 'octocov'
    zsh_completion.install 'octocov.zsh' => '_octocov'
  end
end
