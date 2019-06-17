# This file was generated by GoReleaser. DO NOT EDIT.
class Harvest < Formula
  desc "Portable log aggregation tool for middle-scale system operation/observation."
  homepage "https://github.com/k1LoW/harvest"
  url "https://github.com/k1LoW/harvest/releases/download/v0.9.0/harvest_v0.9.0_darwin_amd64.zip"
  version "0.9.0"
  sha256 "a44f2f9636b50578c50d8d20d0479e18ab126c5b7a37530fd6b30f43e068a4da"

  def install
    bin.install 'hrv'
  end
end
