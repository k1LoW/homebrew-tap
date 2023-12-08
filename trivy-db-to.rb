# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TrivyDbTo < Formula
  desc "trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource."
  homepage "https://github.com/k1LoW/trivy-db-to"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/trivy-db-to/releases/download/v2.1.0/trivy-db-to_v2.1.0_darwin_arm64.zip"
      sha256 "c1ab04943bc2a7fe21baa3ddd6efb2bcb8257fca1047b783295992d459aa2c74"

      def install
        bin.install "trivy-db-to"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/trivy-db-to/releases/download/v2.1.0/trivy-db-to_v2.1.0_darwin_amd64.zip"
      sha256 "8777cfa9b263cac4686ec59cf0f89ddbee5a373da609a9f7ed37da415f50c7ce"

      def install
        bin.install "trivy-db-to"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/trivy-db-to/releases/download/v2.1.0/trivy-db-to_v2.1.0_linux_amd64.tar.gz"
      sha256 "bbb07ec20bf4cc6edcad93c8c5c623c53449b20a5f5f71a60dab8f225b4622bd"

      def install
        bin.install "trivy-db-to"
      end
    end
  end
end
