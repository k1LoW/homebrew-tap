class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  homepage 'https://github.com/k1LoW/tbls'
  version '1.4.1'
  url "https://github.com/k1LoW/tbls/releases/download/v#{version}/tbls_v#{version}_darwin_amd64.zip"
  sha256 'eb616d1e002438e2577504a6107b739ce2a0c6d9dd745e663928cd9e878e6072'

  def install
    bin.install 'tbls'
  end
end
