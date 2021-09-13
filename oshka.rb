# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Oshka < Formula
  desc "oshka is a tool for extracting nested CI/CD supply chains and executing commands."
  homepage "https://github.com/k1LoW/oshka"
  version "0.4.0"
  license "MIT"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/oshka/releases/download/v0.4.0/oshka_v0.4.0_darwin_amd64.zip"
      sha256 "0cfb6befac5628c13b6d5117d016ab2965e0e9d4454c7c3959098ba5ea871fff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/oshka/releases/download/v0.4.0/oshka_v0.4.0_linux_amd64.tar.gz"
      sha256 "5f0e31264ff5f5323e2f579ff8600b9a00b8e79e856bddb37d743a6ec9607d98"
    end
  end

  def install
    bin.install "oshka"
  end
end