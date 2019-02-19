class Harvest < Formula
  desc 'Portable log aggregation tool for middle-scale system operation/observation.'
  homepage 'https://github.com/k1LoW/harvest'
  version '0.3.0'
  url "https://github.com/k1LoW/harvest/releases/download/v#{version}/harvest_v#{version}_darwin_amd64.zip"
  sha256 '9e722a6ee9ad7d207b38fcd0376555cb5dc488210f60b21a3336e909a1bfca61'

  def install
    bin.install 'hrv'
  end
end
