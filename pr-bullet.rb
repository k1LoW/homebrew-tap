# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class PrBullet < Formula
  desc "pr-bullet is a tool for copying pull request to multiple repositories."
  homepage "https://github.com/k1LoW/pr-bullet"
  version "0.4.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/k1LoW/pr-bullet/releases/download/v0.4.0/pr-bullet_v0.4.0_darwin_amd64.zip"
    sha256 "dda071fb745f15b01f6c63c6148f6379834551b720f9124129f5351aff131ce4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/k1LoW/pr-bullet/releases/download/v0.4.0/pr-bullet_v0.4.0_linux_amd64.tar.gz"
    sha256 "1b9e16dc2f492b035b8ea6726d908495a4baea62a34d861804667b532c71b3c0"
  end

  def install
    bin.install 'pr-bullet'
  end
end
