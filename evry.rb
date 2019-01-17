class Evry < Formula
  desc 'evry split STDIN stream and execute specified command every N lines/seconds.'
  homepage 'https://github.com/k1LoW/evry'
  version '0.2.0'
  url "https://github.com/k1LoW/evry/releases/download/v#{version}/evry_v#{version}_darwin_amd64.zip"
  sha256 '4b5903358ef06d3958d99c48cfb00acb27bb2c4338bf3d0b372f485259a6e344'

  def install
    bin.install 'evry'
  end
end
