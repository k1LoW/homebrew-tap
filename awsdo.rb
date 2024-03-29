# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Awsdo < Formula
  desc "awsdo is a tool to do anything using AWS temporary credentials."
  homepage "https://github.com/k1LoW/awsdo"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.11.1/awsdo_v0.11.1_darwin_arm64.zip"
      sha256 "1824c714a954b449c6950dffe8b438f3aec4c27fe0f9a50023d9306ac096d0d0"

      def install
        bin.install "awsdo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.11.1/awsdo_v0.11.1_darwin_amd64.zip"
      sha256 "961c941c0cfbfe7e65298c7fddb7f916202c54d0103a7e1e770ffae7127e4e43"

      def install
        bin.install "awsdo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.11.1/awsdo_v0.11.1_linux_arm64.tar.gz"
      sha256 "6db72aad12647bc2822d28e2605f1ea12552be1182ac9fa09fa3e8d45821cd1e"

      def install
        bin.install "awsdo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.11.1/awsdo_v0.11.1_linux_amd64.tar.gz"
      sha256 "40caa3400d4ffd2879fad5c1d70dce39660a1d9fe85224fd17b926897f9e7cfa"

      def install
        bin.install "awsdo"
      end
    end
  end
end
