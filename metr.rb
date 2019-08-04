# This file was generated by GoReleaser. DO NOT EDIT.
class Metr < Formula
  desc "metr gets system metrics."
  homepage "https://github.com/k1LoW/metr"
  version "0.1.0"

  if OS.mac?
    url "https://github.com/k1LoW/metr/releases/download/v0.1.0/metr_v0.1.0_darwin_amd64.zip"
    sha256 "6eb01029be7bafe50b1877348bb48aaaf0660499dfeed515a48060690a7ca91a"
  elsif OS.linux?
    url "https://github.com/k1LoW/metr/releases/download/v0.1.0/metr_v0.1.0_linux_amd64.tar.gz"
    sha256 "e161ebb83b393d8519671c3dfa2c410819c5aab6f85a526c4c76a314d6e4b7f7"
  end

  def install
    bin.install 'metr'
  end
end