# This file was generated by GoReleaser. DO NOT EDIT.
class Awsdo < Formula
  desc "awsdo is a tool to do anything using AWS temporary credentials."
  homepage "https://github.com/k1LoW/awsdo"
  version "0.4.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/k1LoW/awsdo/releases/download/v0.4.0/awsdo_v0.4.0_darwin_amd64.zip"
    sha256 "b19898058159c337d23032d6c54f6dd9b6357a4400213ddfd0ee3fab9f00d2d4"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/awsdo/releases/download/v0.4.0/awsdo_v0.4.0_linux_amd64.tar.gz"
      sha256 "0bd4733423ece38b4a8cef610817789806fb0eda78496f671f52debecb76bf8a"
    end
  end

  def install
    bin.install "awsdo"
  end
end
