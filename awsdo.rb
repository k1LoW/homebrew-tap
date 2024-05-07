# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Awsdo < Formula
  desc "awsdo is a tool to do anything using AWS temporary credentials."
  homepage "https://github.com/k1LoW/awsdo"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.12.0/awsdo_v0.12.0_darwin_arm64.zip"
      sha256 "a0c8751d93f0c2713afc1af88a8f869d70dd2116ba904e5d81c04f4ec728d8ef"

      def install
        bin.install "awsdo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.12.0/awsdo_v0.12.0_darwin_amd64.zip"
      sha256 "a8a4a1731e50695f9ccfbb650b1c61463643d47e8f497975e96d26db85178ae6"

      def install
        bin.install "awsdo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.12.0/awsdo_v0.12.0_linux_arm64.tar.gz"
      sha256 "e7fe98e59d0a7e634f6568400a13cdf6fd01d2f4ad00b3748ba14484010017b4"

      def install
        bin.install "awsdo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.12.0/awsdo_v0.12.0_linux_amd64.tar.gz"
      sha256 "a27554a88d3528347f48e258dbc9ec311e81e60cce0300d211eb15eedf7c0ba8"

      def install
        bin.install "awsdo"
      end
    end
  end
end
