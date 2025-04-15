# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ghput < Formula
  desc "ghput is a CI-friendly tool that puts * on GitHub."
  homepage "https://github.com/k1LoW/ghput"
  version "0.14.5"
  license "MIT"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/ghput/releases/download/v0.14.5/ghput_v0.14.5_darwin_arm64.zip"
      sha256 "7d86585041ac8c6c384782293c9990f8b57568a163bba2b7e9816600e9ffd6e9"

      def install
        system './ghput', 'completion', 'bash', '--out', 'ghput.bash'
        system './ghput', 'completion', 'zsh', '--out', 'ghput.zsh'
        bin.install 'ghput'
        bash_completion.install 'ghput.bash' => 'ghput'
        zsh_completion.install 'ghput.zsh' => '_ghput'
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ghput/releases/download/v0.14.5/ghput_v0.14.5_darwin_amd64.zip"
      sha256 "0cfdceba99834a15baaa322dc01ca06eccd066fcd772d05e39977483829a96ec"

      def install
        system './ghput', 'completion', 'bash', '--out', 'ghput.bash'
        system './ghput', 'completion', 'zsh', '--out', 'ghput.zsh'
        bin.install 'ghput'
        bash_completion.install 'ghput.bash' => 'ghput'
        zsh_completion.install 'ghput.zsh' => '_ghput'
      end
    end
  end
end
