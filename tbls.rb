# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  homepage "https://github.com/k1LoW/tbls"
  version "1.55.0"
  license "MIT"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/tbls/releases/download/v1.55.0/tbls_v1.55.0_darwin_arm64.zip"
      sha256 "1f5bf3c8813f36789851e34820a9000f0654ea6a34897313ffb1af9ba01aa798"

      def install
        system './tbls', 'completion', 'bash', '--out', 'tbls.bash'
        system './tbls', 'completion', 'zsh', '--out', 'tbls.zsh'
        bin.install 'tbls'
        bash_completion.install 'tbls.bash' => 'tbls'
        zsh_completion.install 'tbls.zsh' => '_tbls'
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/tbls/releases/download/v1.55.0/tbls_v1.55.0_darwin_amd64.zip"
      sha256 "02a6e3718de1f5687d1ab2a3b9b0ad6bc73cac16b3bc07d748795a16213ade93"

      def install
        system './tbls', 'completion', 'bash', '--out', 'tbls.bash'
        system './tbls', 'completion', 'zsh', '--out', 'tbls.zsh'
        bin.install 'tbls'
        bash_completion.install 'tbls.bash' => 'tbls'
        zsh_completion.install 'tbls.zsh' => '_tbls'
      end
    end
  end
end
