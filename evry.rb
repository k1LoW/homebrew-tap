class Evry < Formula
  desc 'evry split STDIN stream and execute specified command every N lines/seconds.'
  homepage 'https://github.com/k1LoW/evry'
  version '0.2.1'
  url "https://github.com/k1LoW/evry/releases/download/v#{version}/evry_v#{version}_darwin_amd64.zip"
  sha256 'f018208dfa415fedc415b621b6fbcef30ab4288d26dab1f4795ad7d269c56d3a'

  def install
    bin.install 'evry'
  end
end
