class Evry < Formula
  desc 'evry split STDIN stream and execute specified command every N lines/seconds.'
  homepage 'https://github.com/k1LoW/evry'
  version '0.1.0'
  url "https://github.com/k1LoW/evry/releases/download/v#{version}/evry_v#{version}_darwin_amd64.zip"
  sha256 '71bf0ff065175f49c24fd640599df9eb9b54987f61700de12f301d940e76d5d5'

  def install
    bin.install 'evry'
  end
end
