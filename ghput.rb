# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghput < Formula
  desc "ghput is a CI-friendly tool that puts * on GitHub."
  homepage "https://github.com/k1LoW/ghput"
  version "0.12.0"
  license "MIT"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ghput/releases/download/v0.12.0/ghput_v0.12.0_darwin_amd64.zip"
      sha256 "13d116ee7117b7bff1ac01a8e11048e96b48eb6bd53c2e5d24d267793e0f08bf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/ghput/releases/download/v0.12.0/ghput_v0.12.0_darwin_arm64.zip"
      sha256 "b428633d70504b56b4f980e4a3fe082476ef718eeb89754dd5beb07bec437174"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ghput/releases/download/v0.12.0/ghput_v0.12.0_linux_amd64.tar.gz"
      sha256 "1fe1760503190934d67d2ff91c069b8c086d74035310da0c3e78916e6214e736"
    end
  end

  def install
    system './ghput', 'completion', 'bash', '--out', 'ghput.bash'
    system './ghput', 'completion', 'zsh', '--out', 'ghput.zsh'
    bin.install 'ghput'
    bash_completion.install 'ghput.bash' => 'ghput'
    zsh_completion.install 'ghput.zsh' => '_ghput'
  end
end
