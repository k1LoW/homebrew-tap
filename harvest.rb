class Harvest < Formula
  desc 'Portable log aggregation tool for middle-scale system operation/observation.'
  homepage 'https://github.com/k1LoW/harvest'
  version '0.2.2'
  url "https://github.com/k1LoW/harvest/releases/download/v#{version}/harvest_v#{version}_darwin_amd64.zip"
  sha256 '6f5f2ae6ca191f0ba99731ed59ac88e675a0c9a8757cb88b581ad22460e2d614'

  def install
    bin.install 'hrv'
  end
end
