class Harvest < Formula
  desc 'Portable log aggregation tool for middle-scale system operation/observation.'
  homepage 'https://github.com/k1LoW/harvest'
  version '0.5.0'
  url "https://github.com/k1LoW/harvest/releases/download/v#{version}/harvest_v#{version}_darwin_amd64.zip"
  sha256 '74cea4ee4e44a1d55770c1b8aa1a9f5dced17d99062b6a5053972e4e0da01c4c'

  def install
    bin.install 'hrv'
  end
end
