class Harvest < Formula
  desc 'Portable log aggregation tool for middle-scale system operation/observation.'
  homepage 'https://github.com/k1LoW/harvest'
  version '0.2.0'
  url "https://github.com/k1LoW/harvest/releases/download/v#{version}/harvest_v#{version}_darwin_amd64.zip"
  sha256 '84bcde68e2b8d20873ddc6197040d38c0761573aca4bf8587b145dd2a3a628cc'

  def install
    bin.install 'hrv'
  end
end
