# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Awsdo < Formula
  desc "awsdo is a tool to do anything using AWS temporary credentials."
  homepage "https://github.com/k1LoW/awsdo"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.8.0/awsdo_v0.8.0_darwin_amd64.zip"
      sha256 "d8fcc423597860bc010a94d2de63669a0b23c1d67ee6f3d6e81d0e205fabd039"

      def install
        bin.install "awsdo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.8.0/awsdo_v0.8.0_linux_amd64.tar.gz"
      sha256 "7228b4ab3f4bfa22c86b56f1f89a037966dbe2409a6e776c8247f1c5fb50b0b8"

      def install
        bin.install "awsdo"
      end
    end
  end
end
