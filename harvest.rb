class Harvest < Formula
  desc 'Portable log aggregation tool for middle-scale system operation/observation.'
  homepage 'https://github.com/k1LoW/harvest'
  version '0.2.3'
  url "https://github.com/k1LoW/harvest/releases/download/v#{version}/harvest_v#{version}_darwin_amd64.zip"
  sha256 '7ff0ebeb4a96eb87560c4e34675159a50cf4269dd97ec86f9966519fefb28749'

  def install
    bin.install 'hrv'
  end
end
