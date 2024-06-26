# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Dirmap < Formula
  desc "dirmap is a tool for generating a directory map."
  homepage "https://github.com/k1LoW/dirmap"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/dirmap/releases/download/v0.4.0/dirmap_v0.4.0_darwin_amd64.zip"
      sha256 "fb7e17c702503f86f05c0191d069bac3162cf9168b7a1b61f4ba0d1cd763021e"

      def install
        bin.install 'dirmap'
        output = Utils.safe_popen_read("#{bin}/dirmap", 'completion', 'bash')
        (bash_completion/'dirmap').write output
        output = Utils.safe_popen_read("#{bin}/dirmap", 'completion', 'zsh')
        (zsh_completion/'_dirmap').write output
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/dirmap/releases/download/v0.4.0/dirmap_v0.4.0_darwin_arm64.zip"
      sha256 "b6e90248d2593e60884e39a0e50cda842fa830ed1c9466ad876bb30da9567c40"

      def install
        bin.install 'dirmap'
        output = Utils.safe_popen_read("#{bin}/dirmap", 'completion', 'bash')
        (bash_completion/'dirmap').write output
        output = Utils.safe_popen_read("#{bin}/dirmap", 'completion', 'zsh')
        (zsh_completion/'_dirmap').write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/dirmap/releases/download/v0.4.0/dirmap_v0.4.0_linux_amd64.tar.gz"
      sha256 "10135a6a4d253522ea1179871960633417ad17872bb04e76070f7deefc26b11a"

      def install
        bin.install 'dirmap'
        output = Utils.safe_popen_read("#{bin}/dirmap", 'completion', 'bash')
        (bash_completion/'dirmap').write output
        output = Utils.safe_popen_read("#{bin}/dirmap", 'completion', 'zsh')
        (zsh_completion/'_dirmap').write output
      end
    end
  end
end
