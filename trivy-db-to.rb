# This file was generated by GoReleaser. DO NOT EDIT.
class TrivyDbTo < Formula
  desc "trivy-db-to is a tool for migrating/converting vulnerability information from Trivy DB to other datasource."
  homepage "https://github.com/k1LoW/trivy-db-to"
  version "0.3.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/k1LoW/trivy-db-to/releases/download/v0.3.0/trivy-db-to_v0.3.0_darwin_amd64.zip"
    sha256 "af772b22b6d2bd8eccbf2dd4667f09763dd397f6cf43cdb61a34efe204ead4d9"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/trivy-db-to/releases/download/v0.3.0/trivy-db-to_v0.3.0_linux_amd64.tar.gz"
      sha256 "5e35adc980eca71030b99dc6de15897e8ebdddf9c1b2c6fd7c9f4cafce0b5ff0"
    end
  end

  def install
    bin.install "trivy-db-to"
  end
end