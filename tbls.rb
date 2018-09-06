class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.3.0'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'ba043af805af935158cddc7f9cf9cd2382e57340eec523f0b4709641d9ab4b48'

  def install
    bin.install 'tbls'
  end
end
