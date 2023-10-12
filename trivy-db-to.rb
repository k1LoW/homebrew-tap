# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TrivyDbTo < Formula
  desc "trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource."
  homepage "https://github.com/k1LoW/trivy-db-to"
  version "2.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/trivy-db-to/releases/download/v2.0.4/trivy-db-to_v2.0.4_darwin_arm64.zip"
      sha256 "da8217e89c52b5b2f7f20b0bdc7dc6aa7371d1cec3c25435c1d2b0e83bcbcd8a"

      def install
        bin.install "trivy-db-to"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/trivy-db-to/releases/download/v2.0.4/trivy-db-to_v2.0.4_darwin_amd64.zip"
      sha256 "2014d3106cc07a354b42e3dd1bc89f9600f16fec321589b22a9fa81301c2df1f"

      def install
        bin.install "trivy-db-to"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/trivy-db-to/releases/download/v2.0.4/trivy-db-to_v2.0.4_linux_amd64.tar.gz"
      sha256 "a1c3ca5934390d078fb11cc997e6c1e91cb7432b2580ba211066760e614c4012"

      def install
        bin.install "trivy-db-to"
      end
    end
  end
end
