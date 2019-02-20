class Harvest < Formula
  desc 'Portable log aggregation tool for middle-scale system operation/observation.'
  homepage 'https://github.com/k1LoW/harvest'
  version '0.4.0'
  url "https://github.com/k1LoW/harvest/releases/download/v#{version}/harvest_v#{version}_darwin_amd64.zip"
  sha256 '3a0ce507527176e9d06bdc590451115189e3d185e431d8f75e8b4db6b5053915'

  def install
    bin.install 'hrv'
  end
end
